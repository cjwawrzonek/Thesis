#################################################################
# I haven't gotten around to making this class yet, but here's
# my idea: This would be a wrapper class for all things dealing
# with an experiment. This includes:
# 	weights file, and it's data path
# 	experimental parameters
# 	description of experiment
#	some form of standardized title for the damn experiments
#	
# *Ideally, the only argument it requires is a link to an
# experiment folder, and it can determine the rest itself.
#################################################################
#!/usr/bin/python
# Filename: experiment.py
import numpy as np
import math
import sys
import json
import inputGen as ig
import utility as util
from hessianbackprop import HessianBackprop
from hessianrnn import HessianRNN
import shutil

### Right now, its just a copy of input spaces

class experiment:
	'''experiment variables'''
	# None at the moment

	def __init__(self, filepath=None, name="Uninitialized Experiment"):
		self.name = name
		self.initialized = False
		self.trained = False
		self.num_trains = 0
		self.trained = False
		self.exp = {}
		self.filepath = filepath

		if filepath != None:
			read(filepath)

	def read(self, filepath=None):

		if filepath == None:
			filepath = self.filepath
		else:
			self.filepath = filepath

		if self.filepath == None:
			raise Exception("No filepath initialized for this experiment: {}".format(self.exp['name']))

		expfile = open(filepath, 'rb')

		#############################################
		# Read in the experiment file
		#############################################

		# swallow everything in memory
		block = expfile.read()
		lines = block.split("\n")
		expfile.close()
		# free our in-core file copy asap
		del block

		# First, set a line index for reading in the input
		i = 0

		print "Reading in experiment\n"

		# Now read in the experiment line by line and fill in data
		while i < len(lines):
			if not lines[i].startswith("#") and lines[i] != '\n' and lines[i] != '':
				line = lines[i].split("\t")
				print line
				try:
					self.exp[line[0]] = int(line[1])
				except:
					print line
					self.exp[line[0]] = line[1]

			i += 1

		# get the dictionary of phase times
		self.exp['phase_times'] = json.loads(self.exp['phase_times'])

		# get the dictionary of delay times
		self.exp['phase_var'] = json.loads(self.exp['phase_var'])
		print self.exp['phase_var']

		for phase in self.exp['phase_times']:
			self.exp['phase_times'][phase] = int(self.exp['phase_times'][phase])

		for phase in self.exp['phase_var']:
			self.exp['phase_var'][phase] = util.isTrue(self.exp['phase_var'][phase])

		if not 'directory' in self.exp:
			self.exp['directory'] = None
		elif not self.exp['directory'].endswith('/'):
			self.exp['directory'] += '/'

		if not 'train_file' in self.exp:
			self.exp['train_file'] = "{}.train".format(self.exp['name'])

		self.initialized = True

	def createTrainSet(self):

		filepath = "{}{}".format(self.exp['directory'], self.exp['train_file'])

		if self.exp['type'] == "simple":
			pass # ig.simpleGen()
		elif self.exp['type'] == "attention":
			ig.attenGen(self.exp['input_side'], self.exp['num_locs'], self.exp['phase_times'],
						self.exp['phase_var'], filepath=filepath)
		elif self.exp['type'] == "selection":
			pass # ig.selGen()
		elif self.exp['type'] == "combined":
			pass # ig.combGen()
		else:
			raise Exception("Experiment type not in list: {}".format(self.exp['type']))

	def train(self, loadW=False):
		if loadW == True:
			loadW = "{}W".format(self.exp['directory'])

		if self.exp['directory'] == None or self.exp['directory'] == '':
			filepath = self.exp['train_file']
		else:
			filepath = "{}/{}".format(self.exp['directory'], self.exp['train_file'])

		ret = util.readInputs(filepath)

		inputs = ret['inputs']
		targets = ret['targets']
		inputNames = ret["inputNames"]
		targetNames = ret["targetNames"]

		default = True
		# These are your initial hidden_weights, created through the matlab script weights.m
		if default == True:
			weights = open("hidden_weights_default.txt", 'rb+')
			shutil.copyfile("hidden_weights_default.txt", "hidden_weights.txt")
			shutil.copyfile("hidden_mask_default.txt", "hidden_mask.txt")
		else:
			weights = open("hidden_weight.txt", 'rb+')
		line = weights.readline();
		num_lines = 0

		while line != "":
			num_lines += 1
			line = weights.readline()

		weights.close()

		self.rnn = HessianRNN(layers=[len(inputs[0][0]), num_lines - 1, len(targets[0][0])], struc_damping=0.5,
					 use_GPU=False, debug=False, loadW=False, dataPath=self.exp['directory'])

		np.set_printoptions(edgeitems = 10)

		if not loadW:
			isSuccess = train_saccade(self.num_trains, inputNames, targetNames,
									  inputs, targets, self.rnn)
			self.num_trains += 1
			if isSuccess != True:
				print "Error: Overfitting in batch run"
				return False
			print "Training Successful \(0_0)/"
			# Indicate that we finished at least one training cycle and may now load old weights
			self.trained = True
		else:
			print "Loading weights from previous training"
			print "\n\n\n(0_0)\n\n\n"
			isSuccess = train_saccade(self.num_trains, inputNames, targetNames,
									  inputs, targets, rnn, load_weights=loadW)
			self.num_trains += 1
			if isSuccess != True:
				print "Error: Overfitting in batch run"
				return False
			print "Training Successful \(0_0)/"

		return True

	def test(self, W=None):
		raise Exception("Function not implemented yet")

	def __repr__(self):
		return "Experiment Object, Name: {}".format(self.name)

	def __str__(self):
		return "\nExperiment Data: \n{}\n".format(self.exp)

def train_saccade(cycle, input_types, target_types,
				  inputs, targets, rnn,
				  load_weights=None, random_training=False):

	test = (inputs, targets)

	print "Beginning Training"

	# stdout = sys.stdout
	# sys.stdout = out1

	# Main training happens here. CG_iter and max_epochs effect training, so these are parameters i fit by hand
	# lots of work to be done fitting these.
	success = rnn.run_batches(inputs, targets, CG_iter=100, batch_size=None,
				test=test, max_epochs=151, random_training=False,
				load_weights=load_weights, plotting=True)

	# sys.stdout = stdout
	print "Finished Training: Recording outputs"
	print
	index = 0

	training_out = open(rnn.dataPath + "output" + str(cycle) + ".cycle", 'wb+')

	for i, t in zip(inputs, targets):
		print >> training_out
		print >> training_out, "Trail Type: {}\n".format(input_types[index])
		index += 1
		print >> training_out, "Inputs\n"#, i
		# for x in range(len(i)):
		# print >> training_out, dim_scale(i[x], int(np.sqrt(stim_dim - 2)))
		print >> training_out, dim_scale(i[4], int(np.sqrt(len(inputs[0][0]) - 2)))
		print >> training_out, i[4][-4:]
		print >> training_out
		print >> training_out, "Targets\n", t
		print >> training_out
		output = rnn.forward(i, rnn.W)[-1]
		for x in range(len(output)):
			for y in range(len(output[x][0])):
				if output[x][0][y] < 0.001:
					output[x][0][y] = 0
		output = output[:, 0, :]

		print >> training_out, "Output\n", output#rnn.forward(i, rnn.W)[-1]

	training_out.close()

	return success

def dim_scale(array1D, new_dim):
	new_array = np.asarray([[0 for x in range(new_dim)] for y in range(new_dim)])
	for x in range(new_dim):
		for y in range(new_dim):
			new_array[x][y] = array1D[(x*new_dim) + y]

	return new_array

def main():
	expName = sys.argv[1]
	expPath = "{}/{}.exp".format(expName, expName)

	e = experiment()
	e.read(expPath)

	e
	print e

	e.createTrainSet()
	e.train()

if __name__ == "__main__":
	main()
