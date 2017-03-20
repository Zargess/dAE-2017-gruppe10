#include <stdlib.h>
#include <iostream>
#include <cstdlib>
#include <ctime>
#include <algorithm>
#include <chrono>
#include <math.h>
#include <fstream>
#include <string> 
#include <stdio.h>
#include <assert.h> 
#include <string.h>
#include <string>
#include <random>
#include ""../util.cpp"
using namespace std;
int getNumberOfDigits(int number) {
	int n = number;
	int counter = 0;
	while(n != 0) {
		counter++;
		n /= 10;
	}
	return counter;
}

const int N = pow(2, 20);
const int NUM_DIGITS = getNumberOfDigits(N);
int highestInputDigit = N*4;

std::random_device rd;
std::mt19937 mt(rd());

int thisIsMyPow(int base, int exp) {
	int res = 1;
	for(int i = 0; i < exp; i++) {
		res *= base;
	}
	return res;
}

int getDigit(int number, int digitNr) {
	return (number/(int) thisIsMyPow(10, digitNr) ) % 10 ;
}

void printArray(int* array, int size) {
	for(int i = 0; i < size; i++) {
		cout << array[i] << "\t";
	} 
}

void countingSortSinglePass(int* array, int digitToSort) {
	int* storage = new int[N*10]; // 10 since only sorting digits from 0..9
	int next[10];
	for(int i = 0; i < 10; i++) {
		next[i] = i * N;
	}
	
	for(int i = 0; i < N; i++) {
		int value = array[i];
		int key = getDigit(value, digitToSort);
		storage[next[key]] = value;
		next[key]++;
	}
	int counter = 0;
	for(int i = 0; i < 10; i++) {
		for(int j = i * N; j < next[i]; j++) {
			array[counter] = storage[j];
			counter++;
		}
	}
}

void countingSort(int* array, int digitToSort) {
	cout << "This is where I fuck up!" << endl;
	int* output = new int[N];
	int highestDigit = 10;
	int* C = new int[highestDigit];
	for(int i = 0; i < highestDigit; i++) {
		C[i] = 0;
	}
	
	// Count number of occurences of each digit
	for(int j = 0; j < N; j++) {
		C[getDigit(array[j], digitToSort)]++;
	}
	
	// Each entry contains number of digits equal or lower to index of entry
	for(int i = 1; i < highestDigit; i++) {
		C[i] += C[i-1];
	}
	for(int j = N-1; j >= 0; j--) {
		int digitOfNum = getDigit(array[j], digitToSort);
		output[C[digitOfNum]-1] = array[j];
		C[digitOfNum]--;
	}	
	
	for(int i = 0; i < N; i++) {
		array[i] = output[i];
	}
	delete[] output;
}

void radixSortSinglePass(int* array) {
	for(int i = 0; i <= NUM_DIGITS; i++) {
		countingSortSinglePass(array, i);
	}
}

void radixSort(int* array) {
	for(int i = 0; i <= NUM_DIGITS; i++) {
		countingSort(array, i);
	}
}

void verifyAscendingOrder(int* array) {
	for(int i = 0; i < N-1; i++) {
		if(array[i] > array[i+1]) cout << "ERROR. Array not sorted - not ascending order! Array[i]: " << array[i] << " is not leq array[i+1]: "<< array[i+1] << endl;
	}
}
int** runExperimentNtimes(void (*function)(int *)string experimentName) {
	long_long * times = new long_long[iterations];
	long_long * BM = new long_long[iterations];
	long_long * L1Misses = new long_long[iterations];
	long_long * L2Misses = new long_long[iterations];
	int oldN = n;
	
	for(int i = 0; i < iterations; i++) {
		
		//Set rows and colums

		//generate input
		int* input = new int[N];

		std::uniform_real_distribution<double> dist(1.0, (double) highestInputDigit);
		for(int i = 0; i < N; i++) {
			input[i] = ((int) dist(mt) % highestInputDigit);
		}
		
		// Prints
		cout << "iteration: " << i << endl;
		cout << "n: " << n << endl;
		
		// Generate output counters
		long_long time = 0;
		long_long branchCount = 0;
		long_long L1Count = 0;
		long_long insCount = 0;
	
		//generete matrices
		
		// Do the experiemnt
		long_long * retVal = runPapiCounters(function, input);
		
		// Save return values
		time = retVal[0] / 1000000;
		branchCount = retVal[1];
		L1Count = retVal[2];
		insCount = retVal[3];
		
		times[i] = time ; // measured in miliseconds
		BM[i] = branchCount / innerIterations;
		L1Misses[i] = L1Count / innerIterations;
		L2Misses[i] = insCount / innerIterations;
		
		n = increaseN(n);
		
		
		delete[] retVal;
		/*
		if (PAPI_reset(EventSet) != PAPI_OK) {
			handle_error("Could not reset papi....");
		}
		*/
		cout << "------------------------------------------" << endl;
		delete[] matrixArrayAs;
		delete[] matrixArrayBs;
		delete[] AB;
		
	}
	
	n = oldN;
	
	long_long** arrayOfResults = new long_long *[4];
	
	arrayOfResults[0] = times;
	arrayOfResults[1] = BM;
	arrayOfResults[2] = L1Misses;
	arrayOfResults[3] = L2Misses;
	
	
	string names[] = {"times",  "/BM", +  "/L1", "/INS"};
	writeResultsToFile(arrayOfResults, experimentName, names);
	
	delete[] times;
	delete[] BM;
	delete[] L1Misses;
	delete[] L2Misses;
	delete[] arrayOfResults;
}

int main() {

	//printArray(input, N);
	//radixSort(input);
	//verifyAscendingOrder(input);
	//printArray(input, N);
	//cout << "This is N: " << N << ". And this is last element of array: " << input[N-1] <<endl;
	
	runExperimentNTimes(&radixSort, "simple");
}	