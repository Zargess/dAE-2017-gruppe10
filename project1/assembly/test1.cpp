int binarySearchOnBFSStructureTest(int * list, int length, int key) {
	int location = 0;
	int bestSoFar = 0;
	int element = list[0];
	while (element != key) {  	
		if (element > key) {
			location = (location << 1) + 1;
		}
		else {
			location = (location << 1) + 2;
			bestSoFar = location;
		}
		

		if(location >= length) {
			break;
		}
		element = list[location];
		
	}
	if (element != key) return bestSoFar;
	return location;
}