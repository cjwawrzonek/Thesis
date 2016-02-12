#!/usr/bin/python
# Filename: inputSpaces.py
import numpy as np
from types import *
import math

class inputSpace:
	'''Number of input spaces'''
	numSpaces = 0

	def __init__(self, size, name="Default Space"):
		'''The size must be odd'''
		if size % 2 == 0:
			raise Exception("The size of the side must be odd")

		'''The size of the input space along 1D'''
		self.size = size

		'''Name of this input space'''
		self.name = name

		'''the list of input coordinates in this space'''
		self.inputCoors = []

		'''Represents a nxn grid of 2d space.'''
		self.grid = np.zeros((size,size))

		inputSpace.numSpaces += 1
		print "Total number of inputSpaces is: %d" % inputSpace.numSpaces

	def __del__(self):
		'''Deleting Space'''
		print 'Deleting Space %s.' % self.name

		inputSpace.numSpaces -= 1

		if inputSpace.numSpaces == 0:
			print 'No more inputSpaces'
		else:
			print 'There are still %d inputSpaces left.' % inputSpace.numSpaces

	def createInputs(self, numInputs):
		assert type(numInputs) is IntType, "numInputs is not an integer: %r" % numInputs
		arclength = 360 / numInputs
		radius = int(round(self.size / 2))

		self.inputCoors = []

		for i in range(numInputs):
			coor = []
			theta = i*arclength
			# print "Thetat: " + str(theta)
			dx = round(radius*math.cos(math.radians(theta)))
			x_coor = round(radius + dx)
			dy = round(radius*math.sin(math.radians(theta)))
			y_coor = round(radius - dy)

			# print "dx, dy: " + str(dx) + " " + str(dy)
			# print "coor: " + str(y_coor) + " " + str(x_coor)
			# print

			coor.append(y_coor)
			coor.append(x_coor)

			self.inputCoors.append(coor)
		# We know our total number of spaces is increased.

	# Get the input grid for any given input, or list of inputs
	def getInputGrid(self, inputs=[]):
		outgrid = np.zeros((self.size,self.size))
		if type(inputs) is IntType: # just make a grid with this one input
			outgrid[self.inputCoors[inputs][0]][self.inputCoors[inputs][1]] = 1
		elif len(inputs) == 0: # make a grid with all inputs
			for coor in self.inputCoors:
				outgrid[coor[0]][coor[1]] = 1
		else: # make a grid with a set of inputs
			for i in inputs:
				assert i >= 0 and i < len(self.inputCoors), "Input %d does not exist" % i
				outgrid[self.inputCoors[i][0]][self.inputCoors[i][1]] = 1

		return outgrid

	# get the coordinate of the specified input number
	def getCoor(self, i):
		assert i >= 0 and i < len(self.inputCoors), "Input %d does not exist" % i
		return self.inputCoors[i]

	# return all the input coordinates for this space
	def getCoors(self):
		return self.inuptCoors

	# print the input space including any set of given inputs
	def printSpace(self, inputs=[]):
		print "Input Coordinates:"
		print self.inputCoors
		outgrid = self.getInputGrid(inputs)

		for i in range(self.size):
			print outgrid[i]