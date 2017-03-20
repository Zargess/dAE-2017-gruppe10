int binarySearchOnBFSStructure(int * list, int length, int key) {
	int location = 0;
	int bestSoFar = 0;
	while (list[location] != key && location < length) { 		
		if (list[location] > key) {
			location = 2 * location + 1;
		}
		else {
			location = 2 * location + 2;
			bestSoFar = location;
		}
	}
	if (list[location] != key) return bestSoFar;
	return location;
}