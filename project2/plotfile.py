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
		plt.plot(inputsize, value, marker=next(marker), linestyle ='--', label=legend)
		#highestY = value[len(value)-1]
	
	plt.legend(loc=2,borderaxespad=0.)
	plt.xlabel('Inputsize')
	plt.ylabel('Runtime (ms)')
	plt.xscale("log", basex=2)
	#plt.axvline(x=2**20, color='black', linestyle='--', label="L3 cache size")
	#ymin, ymax = plt.gca().get_ylim();
	#plt.text(2**20, highestY * 0.9 , "L3 cache size",  rotation=270)
	
def plotValues(allData, ylabel):
	#allData is a list of tuples with form ((n, value), legend)
	plt.figure()
	
	marker = itertools.cycle(allMarkers)
	
	
	for ((inputsize, value), legend) in allData:
		plt.plot(inputsize, value , marker=next(marker), linestyle ='--', label=legend)
		#highestY = value[len(value)-1]
	
	plt.legend(loc=2, borderaxespad=0.)
	plt.xlabel('Inputsize')
	plt.ylabel(ylabel)
	plt.xscale("log", basex=2)
	#plt.axvline(x=2**13, color='black', linestyle='--', label="L1 cache size")
	#plt.text(2**13, highestY * 0.9	, "L1 cache size",  rotation=270)

	

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
	allRuntimes.append((readFile("./data/ordMult/times.txt"), "Ordinary multiplication"))
	allRuntimes.append((readFile("./data/parallel/times.txt"), "parallel multiplication"))
	allRuntimes.append((readFile("./data/strassen/times.txt"), "strassen multiplication"))
	allRuntimes.append((readFile("./data/strassenPara/times.txt"), "strassen parallel multiplication"))
	plotRuntimeYDividedByLogN(allRuntimes)
	
	
	#Plotting branch mispredictions
	allBranchMissPreds = []
	allBranchMissPreds.append((readFile("./data/ordMult/BM.txt"), "Ordinary multiplication"))
	allBranchMissPreds.append((readFile("./data/parallel/BM.txt"), "parallel multiplication"))
	allBranchMissPreds.append((readFile("./data/strassen/BM.txt"), "strassen multiplication"))
	allBranchMissPreds.append((readFile("./data/strassenPara/BM.txt"), "strassen parallel multiplication"))
	plotValues(allBranchMissPreds, 'Branch Mispredictions')
	
	#Plotting L1 cache misses
	allCachemisses = []
	allCachemisses.append((readFile("./data/ordMult/L1.txt"), "Ordinary multiplication"))
	allCachemisses.append((readFile("./data/parallel/L1.txt"), "parallel multiplication"))
	allCachemisses.append((readFile("./data/strassen/L1.txt"), "strassen multiplication"))
	allCachemisses.append((readFile("./data/strassenPara/L1.txt"), "strassen parallel multiplication"))
	plotValues(allCachemisses, 'L1 cache misses')
	
	#Plotting number of instructions
	allCachemisses = []
	allCachemisses.append((readFile("./data/ordMult/INS.txt"), "Ordinary multiplication"))
	allCachemisses.append((readFile("./data/parallel/INS.txt"), "parallel multiplication"))
	allCachemisses.append((readFile("./data/strassen/INS.txt"), "strassen multiplication"))
	allCachemisses.append((readFile("./data/strassenPara/INS.txt"), "strassen parallel multiplication"))
	plotValues(allCachemisses, 'Instructions')

	plt.show()
	
if __name__ == "__main__":
	plot()
