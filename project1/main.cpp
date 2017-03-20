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
#include "papi.h"

using namespace std;

int * points;
int * bfsStructure;
int highestIndex = 0;
double multFactor = 1.3;
int n = 10;
int iterations = 69;
const int innerIterations = 200000;

int * getRandom(int n, int heighestValue) {

	int * r = new int[n];

	// set the seed
	srand((unsigned)time(NULL));

	for (int i = 0; i < n; i++) {
		int value = rand() % heighestValue;
		r[i] = value;
	}

	return r;
}

int * getSequentialList(int n) {
	int * r = new int[n];
	
	for (int i = 0; i < n; i++) {
		int value = i;
		r[i] = value;
	}
	
	return r;
}

int * getData(int n) {
	int * r = new int[n];

	for (int i = 0; i < n; i++) {
		r[i] = 3 * i;
	}

	return r;
}

int giveMeCompleteTreeMedian(int n) {
	int x = 1;

	int bitlength =  floor(log2(n)) + 1;
	
	if(bitlength != 0) {
		x =  1 << (int) (bitlength - 1 );	
	}

	if (floor(x/2) - 1 <= (n-x)) {
		return x - 1;
	} else {
		return n - floor(x/2);
	}
		
}

int binarySearchSimple(int* points, int n, int key) {
	int lowerBound = 0;
	int upperBound = n - 1;
	int position = n / 2;
	int bestSoFar = 0;

	while (points[position] != key && lowerBound <= upperBound) {
		if (points[position] > key) {
			upperBound = position - 1;
		}
		else {
			lowerBound = position + 1;
			bestSoFar = position;
		}
		position = (upperBound + lowerBound) / 2;
	}	
	if (points[position] != key) return bestSoFar;
	return position;
}

void createNewBFSStructure(int lower, int upper, int parentIndex, bool isLeftChild) {
	/*
	* 1. Compute median
	* 2. Insert Median
	* 3. make two recursive calls with lower and upper adjustedr
	* 4. Stop condition
	*/
	int lowerPlusUpper = lower + upper;
	int numberOfElements = (upper - lower) + 1;
	int medianIndex = giveMeCompleteTreeMedian(numberOfElements) + lower;
	
	int indexToInsertAt = (parentIndex * 2) + 1; //

	if (!isLeftChild) {
		indexToInsertAt++;
	}
	bfsStructure[indexToInsertAt] = points[medianIndex];

	if (lower <= (medianIndex - 1)) {
		createNewBFSStructure(lower, medianIndex - 1, indexToInsertAt, true);
	}
	if ((medianIndex + 1) <= upper) {
		createNewBFSStructure(medianIndex + 1, upper, indexToInsertAt, false);
	}

}

int * initializeArray(int n) {
	int * res = new int[n];
	for (int i = 0; i < n; i++) {
		res[i] = -1;
	}
	return res;
}

int getOutputSize(int n) {
	int res = 0;
	for (int i = 0; i < ceil(log2(n)); i++) {
		res = 2 * res + 2;
	}
	return res;
}

int * createBFSArray(int n) {
	// for 3 table input
	//points = getData(n);
	
	// sequential input
	points = getSequentialList(n);

	bfsStructure = initializeArray(n);
	int firstMedianIndex = giveMeCompleteTreeMedian(n);
	bfsStructure[0] = points[firstMedianIndex];

	createNewBFSStructure(0, firstMedianIndex - 1, 0, true);
	createNewBFSStructure(firstMedianIndex + 1, (n - 1), 0, false);

	delete[] points;
	return bfsStructure;
}

int binarySearchOnBFSStructure(int * list, int length, int key) {
	int location = 0;
	int bestSoFar = 0;
	while (location < length && list[location] != key) { 
		if (list[location] > key) {
			location = 2 * location + 1;
		}
		else {
			location = 2 * location + 2;
			bestSoFar = location;
		}
	}
	if (location >= length) return bestSoFar;
	return location;
}

int binarySearchOnBFSStructureLI(int * list, int length, int key) {
	int location = 0;
	int bestSoFar = 0;
	int element = list[location];
	while (location < length && element != key) { 
		element = list[location];
		location = (location * 2) + 1;
		if(element <= key) {
			location++;	
			bestSoFar = location;
		}
		
	}
	if (element != key) return bestSoFar;
	return location;
}			


void handle_error(const char* s) {
	cout << s << endl;
}

int initPapi() {
	int retval, EventSet = PAPI_NULL;
 
	/* Initialize the library */
	retval = PAPI_library_init(PAPI_VER_CURRENT);
	if (retval != PAPI_VER_CURRENT) {
		cout << "Papi init error" << endl;
		exit(1);
	}

	if (PAPI_create_eventset(&EventSet) != PAPI_OK) {
		handle_error("Could not create event set.");
	}

	/* Add it to the eventset */
	if (PAPI_add_event(EventSet, PAPI_BR_MSP) != PAPI_OK) {
		handle_error("Could not add event.");
	}
	
	/* Add it to the eventset */
	if (PAPI_add_event(EventSet, PAPI_L1_DCM) != PAPI_OK) {
		handle_error("Could not add event.");
	}

	/* Add it to the eventset */
	if (PAPI_add_event(EventSet, PAPI_TOT_INS) != PAPI_OK) {
		handle_error("Could not add event.");
	}
	return EventSet;
	
}


int * queryTimeAndPapi(int (*function)(int *, int, int), int * list, int * queryList, int EventSet) {

	int * results = new int[4];
	long_long values[3];
	int query = 0;
	
	(*function)(list, n, queryList[0]); // run once before timing start to avoid overhead
	auto begin = std::chrono::high_resolution_clock::now();

	if(PAPI_start(EventSet) != PAPI_OK) {
		handle_error("Start does not work.");
		cout << PAPI_strerror(PAPI_start(EventSet)) << endl;
	}
	
	for(int i=1; i<innerIterations; i++) {
		query = queryList[i];
		int res = (*function)(list, n, query);
	}
	
	if(PAPI_read(EventSet, values) != PAPI_OK) {
		handle_error("Read did not work.");
	}

	if (PAPI_stop(EventSet, values) != PAPI_OK) {
		handle_error("Could not stop papi.... sad face");
	}

	auto endTime = std::chrono::high_resolution_clock::now();
	int64_t elapsed_secs = std::chrono::duration_cast<std::chrono::nanoseconds>(endTime - begin).count();
	
	results[0] = elapsed_secs;
	results[1] = values[0];
	results[2] = values[1];
	results[3] = values[2];
	
	return results;
}

void printArraySequentially(int length) {
	for(int i = 0; i<length; i++) {
		cout << bfsStructure[i] << endl;
	}
}

int** generateListsOfQueryLists() {
	int **queries = new int *[iterations]; //malloc(sizeof(int*) * iterations);
	int tempN = n;
	for (int i = 0 ; i != iterations ; i++) {
		int * randomNumbers = getRandom(innerIterations, tempN);
		queries[i] = randomNumbers; //malloc(sizeof(int) * innerIterations);
		tempN = ceil(tempN * multFactor);
	}
	return queries;
}

void writeResultsToFile(int** arrayOfResults, string names[]) {
	for(int i = 0; i < 4; i++) {
		int tempN = n;
		ofstream myfile;
		myfile.open("data/" + names[i] + ".txt");
		for(int j = 0; j < iterations; j++) {			
			myfile << tempN << "," << arrayOfResults[i][j] << "\n";
			tempN = ceil(tempN * multFactor);
		}
		myfile.close();
	}
}

int** runExperimentNtimes(int* (*structureGenerator)(int), int (*function)(int *, int, int), int EventSet, int** queries, string experimentName) {
	int * times = new int[iterations];
	int * BM = new int[iterations];
	int * L1Misses = new int[iterations];
	int * L2Misses = new int[iterations];
	int oldN = n;
	
	for(int i = 0; i < iterations; i++) {
		
		//generate structure
		int * structure = structureGenerator(n);
		
		// Prints
		cout << "iteration: " << i << endl;
		cout << "n: " << n << endl;
		
		// Generate output counters
		int time = 0;
		int branchCount = 0;
		int L1Count = 0;
		int L2Count = 0;
		
		// Inneriterations keys for the search 
		int * queryList = queries[i];
		
		// Do the experiemnt
		int * retVal = queryTimeAndPapi(function, structure, queryList, EventSet);
		
		// Save return values
		time = retVal[0];
		branchCount = retVal[1];
		L1Count = retVal[2];
		L2Count = retVal[3];
		
		times[i] = time / 1000000; // measured in miliseconds
		BM[i] = branchCount / innerIterations;
		L1Misses[i] = L1Count / innerIterations;
		L2Misses[i] = L2Count / innerIterations;
		
		n = ceil(n * multFactor);
		
		delete[] retVal;
	
		if (PAPI_reset(EventSet) != PAPI_OK) {
			handle_error("Could not reset papi....");
		}

		cout << "Papi reset counter" << endl;
		cout << "------------------------------------------" << endl;
		delete[] structure;
	}
	
	n = oldN;
	
	int** arrayOfResults = new int *[4];

	arrayOfResults[0] = times;
	arrayOfResults[1] = BM;
	arrayOfResults[2] = L1Misses;
	arrayOfResults[3] = L2Misses;
	
	
	string names[] = {experimentName + "times",experimentName +  "BM",experimentName +  "L1",experimentName +  "L2"};
	
	writeResultsToFile(arrayOfResults, names);
	
	delete[] times;
	delete[] BM;
	delete[] L1Misses;
	delete[] L2Misses;
	delete[] arrayOfResults;
}



int main() {
	
	// PAPI start
	int retval, EventSet = PAPI_NULL;
	EventSet = initPapi();
	
	//Generate queries
	int** queries = generateListsOfQueryLists();	
	
	// Generate BFS structure and run experiments	
	runExperimentNtimes(&createBFSArray, &binarySearchOnBFSStructure, EventSet, queries, "BFS");
	
	// Generate sorted array and run experiments
	runExperimentNtimes(&getSequentialList, &binarySearchSimple, EventSet, queries, "Simple");

	// Generate BFS structure and run experiments with less instructions in query
	runExperimentNtimes(&createBFSArray, &binarySearchOnBFSStructureLI, EventSet, queries, "BFSLI");
	
	// Clean up
	delete[] queries;

	cout << "Main is Done" << endl;
	return 0;
}
