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
#include "../util.cpp"
#include "../papi.h"
#include <omp.h>
#include "../papi_wrapper.h"
#include "../papi_wrapper.cpp"

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

int findMaxInArray(int * array, int size) {
	int result = 0;
	for(int i = 0; i < size; i++) {
		if(array[i] > result) {
			result = array[i];
		}
	}
	return result;
}

int highestInputDigit = n*4;
const int NUM_DIGITS = getNumberOfDigits(highestInputDigit);

int** generateInputLists(int heighestValue) {
	int **res = new int *[iterations]; //malloc(sizeof(int*) * iterations);
	int tempN = n;
	for (int i = 0; i < iterations; i++) {
		int * randomNumbers = getRandom(tempN, heighestValue);
		res[i] = randomNumbers; //malloc(sizeof(int) * innerIterations);
		tempN = ceil(tempN * multFactor);
	}
	return res;
}

int** generateSeqInputLists() {
	int **res = new int *[iterations]; //malloc(sizeof(int*) * iterations);
	int tempN = n;
	for (int i = 0; i < iterations; i++) {
		int * list = getSequentialList(tempN);
		res[i] = list; //malloc(sizeof(int) * innerIterations);
		tempN = ceil(tempN * multFactor);
	}
	return res;
}

int** generateNormInputLists(int heighestValue) {
	int **res = new int *[iterations]; //malloc(sizeof(int*) * iterations);
	int tempN = n;
	int value = heighestValue;
	for (int i = 0; i < iterations; i++) {
		int * normList = getNormalDist(tempN, value);
		res[i] = normList; //malloc(sizeof(int) * innerIterations);
		tempN = ceil(tempN * multFactor);
		value *= multFactor;
	}
	return res;
}

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
	int* storage = new int[n*10]; // 10 since only sorting digits from 0..9
	int next[10];
	for(int i = 0; i < 10; i++) {
		next[i] = i * n;
	}
	
	for(int i = 0; i < n; i++) {
		int value = array[i];
		int key = getDigit(value, digitToSort);
		storage[next[key]] = value;
		next[key]++;
	}
	int counter = 0;
	for(int i = 0; i < 10; i++) {
		for(int j = i * n; j < next[i]; j++) {
			array[counter] = storage[j];
			counter++;
		}
	}
	
	delete[] storage;
}

void countingSort(int* array, int digitToSort) {
	//cout << "This is where I fuck up!" << endl;
	int* output = new int[n];
	int highestDigit = 10;
	int* C = new int[highestDigit];
	for(int i = 0; i < highestDigit; i++) {
		C[i] = 0;
	}
	
	// Count number of occurences of each digit
	for(int j = 0; j < n; j++) {
		C[getDigit(array[j], digitToSort)]++;
	}
	
	// Each entry contains number of digits equal or lower to index of entry
	for(int i = 1; i < highestDigit; i++) {
		C[i] += C[i-1];
	}
	for(int j = n-1; j >= 0; j--) {
		int digitOfNum = getDigit(array[j], digitToSort);
		output[C[digitOfNum]-1] = array[j];
		C[digitOfNum]--;
	}	
	
	for(int i = 0; i < n; i++) {
		array[i] = output[i];
	}
	delete[] output;
	delete[] C;
}

void radixSortSinglePass(int* array) {
	int numberOfDigits = getNumberOfDigits(findMaxInArray(array, n));
	for(int i = 0; i <= numberOfDigits; i++) {
		countingSortSinglePass(array, i);
	}
}

void radixSort(int* array) {
	int numberOfDigits = getNumberOfDigits(findMaxInArray(array, n));
	for(int i = 0; i <= numberOfDigits; i++) {
		countingSort(array, i);
	}
}

void sortIntoBuckets(int* array, int** buckets, int* next, int size, int digitToSort) {
	
	for(int i = 0; i < size; i++) {
		int digitOfNr = getDigit(array[i], digitToSort);
		buckets[digitOfNr][next[digitOfNr]++] = array[i];
	}
}

void radixSortRecursive(int* array, int size, int digitToSort) {

	int** buckets = new int*[10];
	for(int i = 0; i < 10; i++) {
		buckets[i] = new int[size];
	}
	int next[10];
	for(int i = 0; i < 10; i++ ) {
		next[i] = 0;
	}
	
	sortIntoBuckets(array, buckets, next, size, digitToSort);
	for(int i = 0; i < 10; i++) {
		if(digitToSort > 0 && next[i] > 1) {
			radixSortRecursive(buckets[i], next[i], digitToSort-1);
		}
	}
	int counter = 0;
	for(int i = 0; i < 10; i++) {
		for(int j = 0; j < next[i]; j++) {
			array[counter++] = buckets[i][j];
		}
	}
	
	delete[] buckets;
}

void radixSortRecursiveStart(int* array) {
	int highestNumber = findMaxInArray(array, n);
	int nrOfDigitsInHN = getNumberOfDigits(highestNumber); 
	radixSortRecursive(array, n, nrOfDigitsInHN-1);
}

void verifyAscendingOrder(int* array) {
	for(int i = 0; i < n-1; i++) {
		if(array[i] > array[i+1]) cout << "ERROR. Array not sorted - not ascending order! Array[i]: " << array[i] << " is not leq array[i+1]: "<< array[i+1] << endl;
	}
}

long_long * runPapiCounters(void (*function)(int *), int* input) {
	long_long * results = new long_long[4];
	papi_init( num_threads );
		
	/* Declare an array of polymorphic papi counter sets, one for each thread */
	std::vector< papi_base* > papi_counters;
	
	for( uint32_t i = 0; i < num_threads; ++i ) {		
		papi_counters.push_back(new papi_dAE());
	}
		
	auto begin = std::chrono::high_resolution_clock::now();
	papi_base::start_papi_array( papi_counters );

	for(int i = 0; i < innerIterations; i++) {
		(*function)(input);
	}
	
	papi_base::stop_papi_array( papi_counters );
		
	auto endTime = std::chrono::high_resolution_clock::now(); 
	papi_base::sum_papi_array( papi_counters );
	
		
	std::cout << "papi counters " << *( papi_counters[ 0 ] ) << std::endl;
	
	papi_dAE* result = dynamic_cast<papi_dAE*>(papi_counters[ 0 ]);
	
	//cout << "L1 misses: " << result->l1_cache_misses() << endl;
	int64_t elapsed_secs = std::chrono::duration_cast<std::chrono::nanoseconds>(endTime - begin).count();
	results[0] = elapsed_secs;
	results[1] = result->branch_misses();
	results[2] = result->l1_cache_misses();
	results[3] = result->total_instructions();
	
	return results;
	
}

void writeResultsToFile(long_long** arrayOfResults, string folder, string names[]) {
	for(int i = 0; i < 4; i++) {
		int tempN = n;
		ofstream myfile;
		myfile.open("data/" + folder + "/" + names[i] + ".txt");
		for(int j = 0; j < iterations; j++) {
			myfile << tempN << "," << arrayOfResults[i][j] << "\n";
			tempN = ceil(tempN * multFactor);
		}
		myfile.close();
	}
}

int** runExperimentNtimes(void (*function)(int *), string experimentName, int** inputs) {
	long_long * times = new long_long[iterations];
	long_long * BM = new long_long[iterations];
	long_long * L1Misses = new long_long[iterations];
	long_long * L2Misses = new long_long[iterations];
	int oldN = n;
	
	for(int i = 0; i < iterations; i++) {
		
		//Set rows and colums
		
		//generate input
		int* input = inputs[i];
		/*
		int* input = new int[n];

		std::uniform_real_distribution<double> dist(1.0, (double) highestInputDigit);
		for(int i = 0; i < n; i++) {
			input[i] = ((int) dist(mt) % highestInputDigit);
		}*/
		
		// Prints
		cout << "iteration: " << i << endl;
		cout << "n: " << n << endl;
		
		int x = input[n - 1];
		
		// Generate output counters
		long_long time = 0;
		long_long branchCount = 0;
		long_long L1Count = 0;
		long_long insCount = 0;
	
		//generete matrices
		
		// Do the experiemnt
		long_long * retVal = runPapiCounters(function, input);
		
		// Save return values
		time = retVal[0] / 1000;
		branchCount = retVal[1];
		L1Count = retVal[2];
		insCount = retVal[3];
		
		times[i] = time ; // measured in miliseconds
		BM[i] = branchCount / innerIterations;
		L1Misses[i] = L1Count / innerIterations;
		L2Misses[i] = insCount / innerIterations;
		
		n = n * multFactor;
		
		
		delete[] retVal;
		/*
		if (PAPI_reset(EventSet) != PAPI_OK) {
			handle_error("Could not reset papi....");
		}
		*/
		cout << "------------------------------------------" << endl;
		
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
	//Input: Already sorted, Normal dist or uniform dist.
	//int** inputs = generateNormInputLists(4 * n);
	//int** inputs = generateSeqInputLists();
	int** inputs = generateInputLists(4 * n);
	
	//runExperimentNtimes(&radixSort, "Naive", inputs);
	//runExperimentNtimes(&radixSortSinglePass, "SinglePass", inputs);
	runExperimentNtimes(&radixSortRecursiveStart, "Recursive", inputs);
	delete[] inputs;
}	