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
#include <omp.h>
#include "papi_wrapper.h"


using namespace std;

double multFactor = 2.0;
int n = 2;
int iterations = 5;
const int innerIterations = 5;
uint32_t num_threads = 1;

std::random_device rd;
std::mt19937 mt(rd());

void printMatrix(int ** matrix, int rows, int columns) {
	for (int i = 0; i < rows; i++) {
		for (int j = 0; j < columns; j++) {
			cout << matrix[i][j] << "\t";	
		}
		cout << endl;
	}
}

int * initializeArray(int n) {
	int * res = new int[n];
	for (int i = 0; i < n; i++) {
		res[i] = 0;
	}
	return res;
}

void initMatrix(int** A, int rows, int columns) {
	for (int i = 0; i <	rows; i++) {
		A[i] = initializeArray(columns);
	}
}

void create_random_matrix(int ** A, int rows, int columns, int heighestValue) {
	std::uniform_real_distribution<double> dist(1.0, (double) heighestValue);
	initMatrix(A, rows, columns);
	int i1, i2;

	for (i1 = 0; i1 < rows; i1++) {
		for (i2 = 0; i2 < columns; i2++) {
			A[i1][i2] = (int)dist(mt);
		}
	}
}

void generateXMatrices(int *** matrixArray, int rows, int columns, int number) {
	for (int i = 0; i<number; i++) {
		int** A = new int * [rows];
		create_random_matrix(A, rows, columns, 10);
		matrixArray[i] = A;
	}
}


void handle_error(const char* s) {
	cout << s << endl;
}

int * getRandom(int n, int heighestValue) {
	int * r = new int[n];
	
	std::uniform_real_distribution<double> dist(1.0, (double) heighestValue);
	for (int i = 0; i < n; i++) {
		r[i] = ((int) dist(mt) % heighestValue);
	}

	return r;
}

int * getNormalDist(int n, int heighestValue) {
	int * r = new int[n];
	double my = (double) heighestValue / 2;
	
	std::normal_distribution<double> dist(my, my / 3);
	for (int i = 0; i < n; i++) {
		r[i] = abs(((int) dist(mt)));
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

void matrix_add(int** A, int** B, int** res, int shape) {
	for(int i = 0; i < shape; i++) {
		for(int j = 0; j < shape; j++) {
			res[i][j] = A[i][j] + B[i][j];
		}
	}
}

void matrix_sub(int** A, int** B, int ** res, int shape) {
	for(int i = 0; i < shape; i++) {
		for(int j = 0; j < shape; j++) {
			res[i][j] = A[i][j] - B[i][j];
		}
	}
}

unsigned long int getThreadNumber() {
	return (unsigned long int) omp_get_thread_num();
}


/**
 * Initialises papi for use on each thread.
 */
void papi_init( uint32_t num_threads ) {

	srand( (unsigned) time(0) );
	
	if( PAPI_is_initialized() == PAPI_NOT_INITED ) {
	
		// Initialize PAPI library for each thread.
		PAPI_library_init( PAPI_VER_CURRENT );
#pragma omp parallel num_threads( num_threads )
		{
			if( PAPI_thread_init( pthread_self ) != PAPI_OK ) {
				 handle_error("Threads support not initialized");;
			}
		}
	}
}


int initPapi() {
	int retval, EventSet = PAPI_NULL;
 
	/* Initialize the library */
	retval = PAPI_library_init(PAPI_VER_CURRENT);
	if (retval != PAPI_VER_CURRENT) {
		cout << "Papi init error" << endl;
		exit(1);
	}
  	/*
	#pragma omp parallel num_threads( getThreadNumber() )
		{
			if( PAPI_thread_init( pthread_self ) != PAPI_OK ) {
				 exit(0);
				//handle_error("Threads support not initialized");
			}
		}
	*/

/*
	if (PAPI_thread_init(pthread_self) != PAPI_OK)
  		handle_error("Threads support not initialized");
	*/
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

long_long * queryTimeAndPapi(void (*function)(int **, int **, int **, int*), int*** A, int*** B, int** AB, int* dims, int EventSet) {

	long_long * results = new long_long[4];
	long_long values[3];
	
	//(*function)(list, n, queryList[0]); // run once before timing start to avoid overhead
	auto begin = std::chrono::high_resolution_clock::now();
/*
	if(PAPI_start(EventSet) != PAPI_OK) {
		handle_error("Start does not work.");
		cout << PAPI_strerror(PAPI_start(EventSet)) << endl;
	}
*/
	for(int i = 0; i < innerIterations; i++) {
		(*function)(A[i], B[i], AB, dims);
		//cout << res[0] << endl;
	}
	/*if(PAPI_read(EventSet, values) != PAPI_OK) {
		handle_error("Read did not work.");
	}
	
	if (PAPI_stop(EventSet, values) != PAPI_OK) {
		handle_error("Could not stop papi.... sad face");
	}
*/
	auto endTime = std::chrono::high_resolution_clock::now();
	int64_t elapsed_secs = std::chrono::duration_cast<std::chrono::nanoseconds>(endTime - begin).count();
	results[0] = elapsed_secs;
	results[1] = values[0];
	results[2] = values[1];
	results[3] = values[2];
	
	return results;
}



