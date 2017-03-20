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
#include "../util.cpp"
#include "../papi.h"
#include <random>
#include <omp.h>
#include "../papi_wrapper.h"
#include "../papi_wrapper.cpp"

using namespace std;

void ord_mult(int ** A, int ** B, int ** AB, int * dims) {
	int r1 = dims[0];
	int c2 = dims[1];
	int c1 = dims[2];
	for(int i = 0; i < r1; ++i) {
        for(int j = 0; j < c2; ++j) {
            for(int k = 0; k < c1; ++k)
            {
                AB[i][j] += A[i][k] * B[k][j];
	
            }
		}
	}	
}

void parallel_mult(int ** A, int ** B, int ** AB, int * dims) {
	int r1 = dims[0];
	int c2 = dims[1];
	int c1 = dims[2];
	int i,j,k;
	omp_set_dynamic(0);
	#pragma omp parallel for schedule(static) num_threads(8) shared(A, B, AB) private(i,j,k) /*collapse(3)*/  //default(shared) private(counter, threadID)
	for(i = 0; i < r1; ++i) {
        for(j = 0; j < c2; ++j) {
            for(k = 0; k < c1; ++k)
            {
				AB[i][j] += A[i][k] * B[k][j];
				/*
				int value = A[i][k] * B[k][j];
				#pragma omp critical 
				{
                	AB[i][j] += value;
				}*/
				//AB[i][j] += value;
				//counter++;
				//cout << ". NumThreads: " << omp_get_num_threads() << ". THIS IS THREAD WITH ID: " << omp_get_thread_num() << endl;
            }
		}
		
	}
	//cout << "number of mults: " << counter << ". NumThreads: " << omp_get_num_threads() << endl;
}


void strassen(int** A, int ** B, int** res, int * dims) {
	int mid = dims[0]; 
	
	if(mid <= 64) {
		ord_mult(A, B, res, dims);
		return;
	}
	mid = mid /2;
	
	int * newDims = new int[3];
	newDims[0] = mid;
	newDims[1] = mid;
	newDims[2] = mid;
	
	int** M1 = new int*[mid];
	int** M2 = new int*[mid];
	int** M3 = new int*[mid];
	int** M4 = new int*[mid];
	int** M5 = new int*[mid];
	int** M6 = new int*[mid];
	int** M7 = new int*[mid];
	
	int** A11 = new int*[mid];
	int** A12 = new int*[mid];
	int** A21 = new int*[mid];
	int** A22 = new int*[mid];
	
	int** B11 = new int*[mid];
	int** B12 = new int*[mid];
	int** B21 = new int*[mid];
	int** B22 = new int*[mid];	
	
	int** C11 = new int*[mid];
	int** C12 = new int*[mid];
	int** C21 = new int*[mid];
	int** C22 = new int*[mid];	
	
	// Initialize all matrices to 0
	{
		initMatrix(M1, mid, mid);
		initMatrix(M2, mid, mid);
		initMatrix(M3, mid, mid);
		initMatrix(M4, mid, mid);
		initMatrix(M5, mid, mid);
		initMatrix(M6, mid, mid);
		initMatrix(M7, mid, mid);
		
		initMatrix(A11, mid, mid);
		initMatrix(A12, mid, mid);
		initMatrix(A21, mid, mid);
		initMatrix(A22, mid, mid);
		
		initMatrix(B11, mid, mid);
		initMatrix(B12, mid, mid);
		initMatrix(B21, mid, mid);
		initMatrix(B22, mid, mid);
		
		initMatrix(C11, mid, mid);
		initMatrix(C12, mid, mid);
		initMatrix(C21, mid, mid);
		initMatrix(C22, mid, mid);
	}
	
	for(int i = 0; i < mid; i++) {
		for(int j = 0; j < mid; j++) {
			A11[i][j] = A[i][j];
			A12[i][j] = A[i][mid + j];
			A21[i][j] = A[mid + i][j];
			A22[i][j] = A[mid + i][mid + j];

			B11[i][j] = B[i][j];
			B12[i][j] = B[i][mid + j];
			B21[i][j] = B[mid + i][j];
			B22[i][j] = B[mid + i][mid + j];				
		}
	}
	
	// M1
	matrix_add(A11, A22, C11, mid);
	matrix_add(B11, B22, C12, mid);
	strassen(C11, C12, M1, newDims);	
	//ord_mult(C11, C12, M1, mid);
	// M2
	matrix_add(A21, A22, C11, mid);
	strassen(C11, B11, M2, newDims);
	//ord_mult(C11, B11, M2, mid);
	//M3
	matrix_sub(B12, B22, C11, mid);
	strassen(A11, C11, M3, newDims);
	//ord_mult(A11, C11, M3, mid);
	//M4
	matrix_sub(B21, B11, C11, mid);
	strassen(A22, C11, M4, newDims);
	//ord_mult(A22, C11, M4, mid);
	//M5
	matrix_add(A11, A12, C11, mid);
	strassen(C11, B22, M5, newDims);
	//ord_mult(C11, B22, M5, mid);
	//M6
	matrix_sub(A21, A11, C11, mid);
	matrix_add(B11, B12, C12, mid);
	strassen(C11, C12, M6, newDims);
	//ord_mult(C11, C12, M6, mid);
	//M7
	matrix_sub(A12, A22, C11, mid);
	matrix_add(B21, B22, C12, mid);
	strassen(C11, C12, M7, newDims);
	//ord_mult(C11, C12, M7, mid);
	
	
	//C11
	matrix_add(M1, M4, A11, mid);
	matrix_sub(A11, M5, A12, mid);
	matrix_add(A12, M7, C11, mid);
	//C12	
	matrix_add(M3, M5, C12, mid);
	//C21
	matrix_add(M2, M4, C21, mid);
	//C22
	matrix_sub(M1, M2, A11, mid);
	matrix_add(A11, M3, A12, mid);
	matrix_add(A12, M6, C22, mid);

	for(int i = 0; i < mid; i++) {
		for(int j = 0; j < mid; j++ ) {
			res[i][j] = C11[i][j];
			res[i][mid + j] = C12[i][j];
			res[mid + i][j] = C21[i][j];
			res[mid + i][mid + j] = C22[i][j];
		}		
	}
	delete[] M1;
	delete[] M2;
	delete[] M3;
	delete[] M4;
	delete[] M5;
	delete[] M6;
	delete[] M7;
	
	delete[] A11;
	delete[] A12;
	delete[] A21;
	delete[] A22;
		
	delete[] B11;
	delete[] B12;
	delete[] B21;
	delete[] B22;
	
	delete[] C11;
	delete[] C12;
	delete[] C21;
	delete[] C22;
	
	delete[] newDims;
}


void strassenPara(int** A, int ** B, int** res, int * dims) {
	int mid = dims[0]; 
	
	if(mid <= 64) {
		parallel_mult(A, B, res, dims);
		return;
	}
	mid = mid /2;
	
	int * newDims = new int[3];
	newDims[0] = mid;
	newDims[1] = mid;
	newDims[2] = mid;
	
	int** M1 = new int*[mid];
	int** M2 = new int*[mid];
	int** M3 = new int*[mid];
	int** M4 = new int*[mid];
	int** M5 = new int*[mid];
	int** M6 = new int*[mid];
	int** M7 = new int*[mid];
	
	int** A11 = new int*[mid];
	int** A12 = new int*[mid];
	int** A21 = new int*[mid];
	int** A22 = new int*[mid];
	
	int** B11 = new int*[mid];
	int** B12 = new int*[mid];
	int** B21 = new int*[mid];
	int** B22 = new int*[mid];	
	
	int** C11 = new int*[mid];
	int** C12 = new int*[mid];
	int** C21 = new int*[mid];
	int** C22 = new int*[mid];	
	
	// Initialize all matrices to 0
	{
		initMatrix(M1, mid, mid);
		initMatrix(M2, mid, mid);
		initMatrix(M3, mid, mid);
		initMatrix(M4, mid, mid);
		initMatrix(M5, mid, mid);
		initMatrix(M6, mid, mid);
		initMatrix(M7, mid, mid);
		
		initMatrix(A11, mid, mid);
		initMatrix(A12, mid, mid);
		initMatrix(A21, mid, mid);
		initMatrix(A22, mid, mid);
		
		initMatrix(B11, mid, mid);
		initMatrix(B12, mid, mid);
		initMatrix(B21, mid, mid);
		initMatrix(B22, mid, mid);
		
		initMatrix(C11, mid, mid);
		initMatrix(C12, mid, mid);
		initMatrix(C21, mid, mid);
		initMatrix(C22, mid, mid);
	}
	
	for(int i = 0; i < mid; i++) {
		for(int j = 0; j < mid; j++) {
			A11[i][j] = A[i][j];
			A12[i][j] = A[i][mid + j];
			A21[i][j] = A[mid + i][j];
			A22[i][j] = A[mid + i][mid + j];

			B11[i][j] = B[i][j];
			B12[i][j] = B[i][mid + j];
			B21[i][j] = B[mid + i][j];
			B22[i][j] = B[mid + i][mid + j];				
		}
	}
	
	// M1
	matrix_add(A11, A22, C11, mid);
	matrix_add(B11, B22, C12, mid);
	strassen(C11, C12, M1, newDims);	
	//ord_mult(C11, C12, M1, mid);
	// M2
	matrix_add(A21, A22, C11, mid);
	strassen(C11, B11, M2, newDims);
	//ord_mult(C11, B11, M2, mid);
	//M3
	matrix_sub(B12, B22, C11, mid);
	strassen(A11, C11, M3, newDims);
	//ord_mult(A11, C11, M3, mid);
	//M4
	matrix_sub(B21, B11, C11, mid);
	strassen(A22, C11, M4, newDims);
	//ord_mult(A22, C11, M4, mid);
	//M5
	matrix_add(A11, A12, C11, mid);
	strassen(C11, B22, M5, newDims);
	//ord_mult(C11, B22, M5, mid);
	//M6
	matrix_sub(A21, A11, C11, mid);
	matrix_add(B11, B12, C12, mid);
	strassen(C11, C12, M6, newDims);
	//ord_mult(C11, C12, M6, mid);
	//M7
	matrix_sub(A12, A22, C11, mid);
	matrix_add(B21, B22, C12, mid);
	strassen(C11, C12, M7, newDims);
	//ord_mult(C11, C12, M7, mid);
	
	
	//C11
	matrix_add(M1, M4, A11, mid);
	matrix_sub(A11, M5, A12, mid);
	matrix_add(A12, M7, C11, mid);
	//C12	
	matrix_add(M3, M5, C12, mid);
	//C21
	matrix_add(M2, M4, C21, mid);
	//C22
	matrix_sub(M1, M2, A11, mid);
	matrix_add(A11, M3, A12, mid);
	matrix_add(A12, M6, C22, mid);

	for(int i = 0; i < mid; i++) {
		for(int j = 0; j < mid; j++ ) {
			res[i][j] = C11[i][j];
			res[i][mid + j] = C12[i][j];
			res[mid + i][j] = C21[i][j];
			res[mid + i][mid + j] = C22[i][j];
		}		
	}
	delete[] M1;
	delete[] M2;
	delete[] M3;
	delete[] M4;
	delete[] M5;
	delete[] M6;
	delete[] M7;
	
	delete[] A11;
	delete[] A12;
	delete[] A21;
	delete[] A22;
		
	delete[] B11;
	delete[] B12;
	delete[] B21;
	delete[] B22;
	
	delete[] C11;
	delete[] C12;
	delete[] C21;
	delete[] C22;
	
	delete[] newDims;
}


bool validateMatrices(int** A, int ** B, int r, int c) {
	bool stuffWorks = true;
	for (int i = 0; i < r; i++) {
		for (int j = 0; j < c; j++) {
			//assert(A[i][j] == B[i][j]);
			//cout << "i: " << i << ", j: " << j << endl;
			if (A[i][j] != B[i][j]) {
				stuffWorks = false;	
			}
		}
	}
	return stuffWorks;
}



int increaseN(int currentN) {
	int res = ceil(currentN * multFactor);	
	if(!(res % 2 == 0)) {
		res++;
	}
	return res;
}

long_long * runPapiCounters(void (*function)(int **, int **, int **, int*), int*** A, int*** B, int** AB, int* dims, int EventSet) {
	long_long * results = new long_long[4];
	papi_init( num_threads );
		
	/* Declare an array of polymorphic papi counter sets, one for each thread */
	std::vector< papi_base* > papi_counters;
	
	for( uint32_t i = 0; i < num_threads; ++i ) {		
		//papi_counters.push_back( new papi_branch()); 
		//papi_counters.push_back( new papi_instructions()); 
		//papi_counters.push_back(new papi_cache());
		papi_counters.push_back(new papi_dAE());
	}
		
	auto begin = std::chrono::high_resolution_clock::now();
	papi_base::start_papi_array( papi_counters );

	for(int i = 0; i < innerIterations; i++) {
		(*function)(A[i], B[i], AB, dims);
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
			myfile << pow(tempN,2) * 3 << "," << arrayOfResults[i][j] << "\n";
			tempN = ceil(tempN * multFactor);
		}
		myfile.close();
	}
}
int** runExperimentNtimes(void (*function)(int **, int **, int **, int*), int EventSet, string experimentName) {
	long_long * times = new long_long[iterations];
	long_long * BM = new long_long[iterations];
	long_long * L1Misses = new long_long[iterations];
	long_long * L2Misses = new long_long[iterations];
	int oldN = n;
	
	for(int i = 0; i < iterations; i++) {
		
		//Set rows and colums
		int r1 = n, c1 = n, r2 = n, c2 = n; // to start with we multiply n x n matrices

		//generate result matrix
		int** AB = new int * [r1];
		initMatrix(AB, r1, c2);

		int * dims = new int[3];
		dims[0] = r1;
		dims[1] = c2;
		dims[2] = c1;
		
		// Prints
		cout << "iteration: " << i << endl;
		cout << "n: " << n << endl;
		
		// Generate output counters
		long_long time = 0;
		long_long branchCount = 0;
		long_long L1Count = 0;
		long_long insCount = 0;
	
		//generete matrices
		int *** matrixArrayAs = new int**[innerIterations];
		generateXMatrices(matrixArrayAs, n, n, innerIterations);
		
		int *** matrixArrayBs = new int**[innerIterations];
		generateXMatrices(matrixArrayBs, n, n, innerIterations);
		
		// Do the experiemnt
		long_long * retVal = runPapiCounters(function, matrixArrayAs, matrixArrayBs, AB, dims, EventSet);
		
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

void runValidation(int numberOfTimes, int n) {
	int fails = 0;
	for (int i = 0; i < numberOfTimes; i++) {
		int *** matrixArrayAs = new int**[1];
		generateXMatrices(matrixArrayAs, n, n, 1);

		int *** matrixArrayBs = new int**[1];
		generateXMatrices(matrixArrayBs, n, n, 1);

		int** AB1 = new int * [n];
		initMatrix(AB1, n, n);

		int * dims1 = new int[3];
		dims1[0] = n;
		dims1[1] = n;
		dims1[2] = n;

		int** AB2 = new int * [n];
		initMatrix(AB2, n, n);


		ord_mult(matrixArrayAs[0], matrixArrayBs[0], AB1, dims1);
		parallel_mult(matrixArrayAs[0], matrixArrayBs[0], AB2, dims1);

		if (!validateMatrices(AB1, AB2, n, n)) {
			fails++;	
		}
		
		delete[] matrixArrayAs;
		delete[] matrixArrayBs;
		
		delete[] AB1;
		delete[] AB2;
		delete[] dims1;
	}
	cout << "Number of fails: " << fails << ", out of: " << numberOfTimes << " tries" << endl;
}



int main() {
	
	//int n = 450;
	/*auto begin = std::chrono::high_resolution_clock::now();
	runValidation(100, 200);	
	auto endTime = std::chrono::high_resolution_clock::now();
	int64_t elapsed_secs = std::chrono::duration_cast<std::chrono::nanoseconds>(endTime - begin).count();
	cout << elapsed_secs / 1000000 << endl;
	*/

		/*papi wrapper stuff*/
	
/*
	uint32_t papi_mode = papi_base::papi_mode_off;
	std::vector< std::pair< std::string, std::string > > custom;

	custom[0].first = "PAPI_L1_DCM";
	custom[0].second = "PAPI_L2_DCM";
*/	
	
	

	//int EventSet = initPapi();
	int EventSet = 0;
	
	
	runExperimentNtimes(&ord_mult, EventSet, "ordMult");
	runExperimentNtimes(&parallel_mult, EventSet, "parallel");
	runExperimentNtimes(&strassen, EventSet, "strassen");
	//runExperimentNtimes(&strassenPara, EventSet, "strassenPara");

	//runValidation(100, 20);	

	

}