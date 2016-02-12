############################################################################
# Use this file to see the weights after the model has finisehd training

# Generates a matlab-esque color map
############################################################################

import pickle

import numpy as np
import matplotlib.pyplot as plt
import sys
import math

from hessianbackprop import HessianBackprop
from hessianrnn import HessianRNN
import pylab as pl
# import plotly.plotly as py
# from plotly.graph_objs import *

fweights = open("weights_matrix_varied_retrained", "rb+")

line = fweights.readline()

line = line.replace("\n", "")
nums = line.split(" ")

layer1 = int(nums[0])
layer2 = int(nums[1])
layer3 = int(nums[2])

line = fweights.readline()

in_to_hid = []
hid_to_hid = []
hid_to_out = []

i = 0
temp = ""
while "break" not in line:
	if "]" in line:
		line = line.replace("]", "")
		temp = temp + line
		temp = temp.replace("\n", "")
		temp_list = temp.split(" ")
		temp_list[:] = [x for x in temp_list if x != ""]
		# try:
		temp_list[:] = [float(x) for x in temp_list]
		in_to_hid.append(temp_list)
		# except:
			# print temp_list
			# exit()
		temp = ""
	else:
		temp = temp + line.replace("[", "")
	i += 1
	line = fweights.readline()

line = fweights.readline()

temp = ""
while "break" not in line:
	if "]" in line:
		line = line.replace("]", "")
		temp = temp + line
		temp = temp.replace("\n", "")
		temp_list = temp.split(" ")
		temp_list[:] = [x for x in temp_list if x != ""]
		# try:
		temp_list[:] = [float(x) for x in temp_list]
		hid_to_hid.append(temp_list)
		# except:
			# print temp_list
			# exit()
		temp = ""
	else:
		temp = temp + line.replace("[", "")
	i += 1
	line = fweights.readline()

line = fweights.readline()

temp = ""
while line != "":
	if "]" in line:
		line = line.replace("]", "")
		temp = temp + line
		temp = temp.replace("\n", "")
		temp_list = temp.split(" ")
		temp_list[:] = [x for x in temp_list if x != ""]
		# try:
		temp_list[:] = [float(x) for x in temp_list]
		hid_to_out.append(temp_list)
		# except:
			# print temp_list
			# exit()
		temp = ""
	else:
		temp = temp + line.replace("[", "")
	i += 1
	line = fweights.readline()

# print hid_to_out[0]
# print len(hid_to_hid)
cnt = 1
length = int(math.sqrt(layer2))

for y in range(layer2):
	# plt.subplot(int(math.sqrt(layer2)), int(math.sqrt(layer2)), y + 1)
	if ((int(y / length)) < 4):
		if (int(y % length)) < 12:
			plt.subplot(4, 12, cnt)
			cnt += 1
	data = []
	i = 0
	for x in range(int(math.sqrt(layer2))):
		# print hid_to_hid[1][i:(i + 8)]
		data.append(hid_to_hid[y + 1][i:(i + int(math.sqrt(layer2)))]) #[y + 1]
		i += int(math.sqrt(layer2))

	data = np.asarray(data)

	if ((int(y / length)) < 4):
		if (int(y % length)) < 12:
			plt.pcolor(data)

	# plt.colorbar()
	# pl.subplot(8, 8, y)

plt.show()