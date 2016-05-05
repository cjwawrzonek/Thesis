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

fweights = open("weights_matrix12x12_works", "rb+")

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
dist_axis = []
weight_axis = []

for x in range(layer2):
	x_coor = [int(x / length), int(x % length)]

	data = []
	i = 0
	for z in range(int(math.sqrt(layer2))):
		# print hid_to_hid[1][i:(i + 8)]
		data.append(hid_to_hid[x + 1][i:(i + int(math.sqrt(layer2)))]) #[y + 1]
		i += int(math.sqrt(layer2))

	data = np.asarray(data)

	# print data
	# print x_coor
	# print data[x_coor[0]][x_coor[1]]
	print data[x_coor[0]][x_coor[1]]
	assert(data[x_coor[0]][x_coor[1]] != 0)

	# exit()

	for y in range(layer2):
		y_coor = [int(y / length), int(y % length)]
		dist = math.sqrt(((x_coor[0] - y_coor[0])**2) + ((x_coor[1] - y_coor[1])**2))
		if data[y_coor[0]][y_coor[1]] != 0:

			dist_axis.append(dist)
			weight_axis.append(data[y_coor[0]][y_coor[1]])

	# plt.subplot(int(math.sqrt(layer2)), int(math.sqrt(layer2)), y + 1)
# plt.scatter(dist_axis, weight_axis)

abs_weights = []
for w in weight_axis:
	# abs_weights.append(abs(w))
	abs_weights.append(w)

dic = {}

for x in range(len(abs_weights)):
	if dist_axis[x] in dic:
		dic[dist_axis[x]] = dic[dist_axis[x]] + abs_weights[x]
	else:
		dic.update({dist_axis[x]: abs_weights[x]})

dist_s = []
sum_w = []
for k, v in iter(sorted(dic.iteritems())):
	dist_s.append(k)
	sum_w.append(v)

# plt.plot(dist_s, sum_w, '-o')

plt.scatter(dist_axis, abs_weights)
plt.show()