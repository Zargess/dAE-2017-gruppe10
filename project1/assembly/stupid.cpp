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