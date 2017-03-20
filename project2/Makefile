CC=g++
LIB=/home/jacob/Desktop/papi-5.5.1/src/libpapi.a -lm -lpthread


all: test
	echo "Done"
test: main.cpp
	#${CC} -std=c++11 -o main main.cpp ${LIB}
	${CC} -std=c++11 main.cpp /home/jacob/Desktop/papi-5.5.1/src/libpapi.a -lm -lpthread -fopenmp -O3 -o main
	./main
clean:
	${RM} *.o test

