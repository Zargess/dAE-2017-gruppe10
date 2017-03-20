import numpy as np
import matplotlib.pyplot as plt
import matplotlib.patches as mpatches
import pylab as pl
from matplotlib import collections  as mc
import sys
from os import listdir
from os.path import isfile, join
import os
import subprocess
import itertools

allMarkers = list(('x', '+', '*', 'o', ','))

def plotRuntimeYDividedByLogN(allData):
	#allData is a list of tuples with form ((n, value), legend)
	marker = itertools.cycle(allMarkers)
	
	plt.figure()
	
	for ((inputsize, value), legend) in allData:
		plt.plot(inputsize, value , marker=next(marker), linestyle ='--', label=legend)
		highestY = value[len(value)-1]
	
	plt.legend(loc=2,borderaxespad=0.)
	plt.xlabel('Inputsize')
	plt.ylabel('Runtime (ms)')
	plt.xscale("log", basex=2)
	plt.axvline(x=2**20, color='black', linestyle='--', label="L3 cache size")
	ymin, ymax = plt.gca().get_ylim();
	plt.text(2**20, ymax*0.7, "L3 cache size",  rotation=270)
	
def plotValues(allData, ylabel):
	#allData is a list of tuples with form ((n, value), legend)
	plt.figure()
	
	marker = itertools.cycle(allMarkers)
	
	
	for ((inputsize, value), legend) in allData:
		plt.plot(inputsize, value , marker=next(marker), linestyle ='--', label=legend)
		highestY = value[len(value)-1]
	
	plt.legend(loc=2, borderaxespad=0.)
	plt.xlabel('Inputsize')
	plt.ylabel(ylabel)
	plt.xscale("log", basex=2)
	plt.axvline(x=2**20, color='black', linestyle='--', label="L3 cache size")
	ymin, ymax = plt.gca().get_ylim();
	plt.text(2**20, ymax*0.7	, "L3 cache size",  rotation=270)

	

def readFile(filename):	
	inputSizes = []
	values = []
	with open(filename) as f:
		for line in f:
			thisLine = line.split(',')
			inputSizes.append(float(thisLine[0]))
			values.append(float(thisLine[1]))
			
	return inputSizes, values
	
	
def plot():
	#Compiling and running c++ implementation
	#subprocess.call(["g++",  "HelloTest.cpp", "-o", "hello.exe"])
	#subprocess.call(["hello.exe"])
	
	# List elements are tuples with layout ((N, value), legend)
	#Plotting runtime divided by log(n)
	allRuntimes = []
	allRuntimes.append((readFile("./data/Naive/times.txt"), "Naive"))
	allRuntimes.append((readFile("./data/SinglePass/times.txt"), "SinglePass"))
	allRuntimes.append((readFile("./data/Recursive/times.txt"), "Recursive"))

	plotRuntimeYDividedByLogN(allRuntimes)
	
	
	#Plotting branch mispredictions
	allBranchMissPreds = []
	allBranchMissPreds.append((readFile("./data/Naive/BM.txt"), "Naive"))
	allBranchMissPreds.append((readFile("./data/SinglePass/BM.txt"), "SinglePass"))
	allBranchMissPreds.append((readFile("./data/Recursive/BM.txt"), "Recursive"))

	plotValues(allBranchMissPreds, 'Branch Mispredictions')
	
	#Plotting L1 cache misses
	allCachemisses = []
	allCachemisses.append((readFile("./data/Naive/L1.txt"), "Naive"))
	allCachemisses.append((readFile("./data/SinglePass/L1.txt"), "SinglePass"))
	allCachemisses.append((readFile("./data/Recursive/L1.txt"), "Recursive"))

	plotValues(allCachemisses, 'L1 cache misses')
	
	#Plotting Instructions
	allCachemisses = []
	allCachemisses.append((readFile("./data/Naive/INS.txt"), "Naive"))
	allCachemisses.append((readFile("./data/SinglePass/INS.txt"), "SinglePass"))
	allCachemisses.append((readFile("./data/Recursive/INS.txt"), "Recursive"))

	plotValues(allCachemisses, 'Instructions')
	
	plt.show()
	
if __name__ == "__main__":
	plot()
