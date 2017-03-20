#include <stdlib.h>
#include <iostream>
//#include "../util.cpp"
using namespace std;
int N = 256;
int** A = new int*[N];
int** B = new int*[N];
bool shouldIPrint = false;


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

void print_matrix(int** A, int size) {
	
	for(int i = 0; i < size; i++) {
		for(int j = 0; j < size; j++) {
			cout << A[i][j] << "\t";
		}
		cout << endl;
	}
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

void ord_mult(int ** A, int ** B, int** res, int shape) {
	for(int i = 0; i < shape; ++i) {
        for(int j = 0; j < shape; ++j) {
			res[i][j] = 0;
            for(int k = 0; k < shape; ++k)
            {
                res[i][j] += A[i][k] * B[k][j];
            }
		}
	}
}
// Only works for N x N matrices
void strassen(int** A, int ** B, int** res, int mid) {
	if(mid <= 1) {
		ord_mult(A, B, res, mid);
		return;
	}
	mid = mid /2;
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
	strassen(C11, C12, M1, mid);	
	//ord_mult(C11, C12, M1, mid);
	// M2
	matrix_add(A21, A22, C11, mid);
	strassen(C11, B11, M2, mid);
	//ord_mult(C11, B11, M2, mid);
	//M3
	matrix_sub(B12, B22, C11, mid);
	strassen(A11, C11, M3, mid);
	//ord_mult(A11, C11, M3, mid);
	//M4
	matrix_sub(B21, B11, C11, mid);
	strassen(A22, C11, M4, mid);
	//ord_mult(A22, C11, M4, mid);
	//M5
	matrix_add(A11, A12, C11, mid);
	strassen(C11, B22, M5, mid);
	//ord_mult(C11, B22, M5, mid);
	//M6
	matrix_sub(A21, A11, C11, mid);
	matrix_add(B11, B12, C12, mid);
	strassen(C11, C12, M6, mid);
	//ord_mult(C11, C12, M6, mid);
	//M7
	matrix_sub(A12, A22, C11, mid);
	matrix_add(B21, B22, C12, mid);
	strassen(C11, C12, M7, mid);
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

int main() {
	// Initialize A
	initMatrix(A, N, N);
	initMatrix(B, N, N);
	for(int i = 0; i < N; i++) {
		for(int j = 0; j < N; j++) {
			A[j][i] = i-j*3;
			B[j][i] = i+j*2;
		}
	}
	// Init result matrix
	int** res = new int*[N];
	int** ordRes = new int*[N];
	initMatrix(res, N, N);
	initMatrix(ordRes, N, N);
	strassen(A, B, res, N);
	ord_mult(A, B, ordRes, N);
	if(shouldIPrint) {
		cout << "THIS IS A:" << endl;
		print_matrix(A, N);
		cout << "THIS IS B:" << endl;
		print_matrix(B, N);
		cout << "THIS IS RES:" << endl;
		print_matrix(res, N);
		cout << "THIS IS ORDMULT:" << endl;
		print_matrix(ordRes, N);
	}
	bool didItValidate = validateMatrices(res, ordRes, N, N);
	cout << "Did it validate? " << didItValidate << endl;
	
}