#include <stdio.h>
#include <unistd.h>
#include <sys/wait.h>
#include <sys/types.h>
#include <sys/shm.h>
#include <sys/ipc.h>
#include <sys/time.h>

#include <vector>

struct Matrax
{
	vector<vector<int> > number;
	Matrax(int dim) {
		int i, j;
		for(i = 0; i < dim; ++i) {
			vector<int> tmp;
			for(j = 0; j < dim; ++j) {
				tmp.push_back(j + dim * i);
			}
			number.push_back(tmp);
		}
	}
};

void compute(int dimension, int process)
{
	Matrax a(dimension), b(dimension);
	struct timeval start, end;
	gettimeofday(&start, 0);
	// compute a * b

	gettimeofday(&end, 0);
	int sec = end.tv_sec - start.tv_sec;
	int usec = end.tv_usec - start.tv_usec;
	printf("%d-process, checksum = %d\n", dimension, checksum);
	printf("elapsed %f ms\n", sec * 1000 + (usjec / 1000.0));
	return;
}

int main(void)
{
    printf("Dimension: ");
    int dim;
    scanf("%d", &dim);
    compute(dim, 1);
    compute(dim, 4);
    return 0;
}
