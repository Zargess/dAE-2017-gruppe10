int binarySearchOnBFSStructure2(int * list, int length, int key) {
	int location = 0;
	int bestSoFar = 0;
	int element = list[location];
	while (element != key && location < length) { 
		if (element > key) {
			location = 2 * location + 1;
		}
		else {
			location = 2 * location + 2;
			bestSoFar = location;
		}
		element = list[location];
	}
	if (element != key) return bestSoFar;
	return location;
}