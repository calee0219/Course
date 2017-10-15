#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>
#include <sys/wait.h>
#include <sys/types.h>
#include <sys/shm.h>
#include <sys/ipc.h>
#include <sys/time.h>

#define BUFFSZ 810*810

int a[BUFFSZ];
int *c;
pid_t master;

void go(int x, int y, int dim)
{
    /*printf("in go");*/
    int ans = 0;
    int i;
    for(i = 0; i < dim; ++i) {
        ans += a[x*dim + i] * a[i*dim + y];
    }
    c[x*dim + y] = ans;
}

void compute(int dimension, int process)
{
	/*Matrax a(dimension), b(dimension);*/
    unsigned int checksum;
    int shmC = shmget(IPC_PRIVATE, sizeof(int)*BUFFSZ, IPC_CREAT | IPC_EXCL | 0777);
    int shmP = shmget(IPC_PRIVATE, sizeof(int)*BUFFSZ, IPC_CREAT | IPC_EXCL | 0777);
    pid_t *pid_list;
    c = shmat(shmC, NULL, 0);
    pid_list = shmat(shmP, NULL, 0);
    int i, j;
    for(i = 0; i < process; ++i)
        pid_list[i] = (pid_t)0;
    for(i = 0; i < dimension; ++i) {
        for(j = 0; j < dimension; ++j) {
            a[i*dimension + j] = i*dimension + j;
        }
    }

	struct timeval start, end;
	gettimeofday(&start, 0);
	// compute a * b
    /*printf("master=%d\n", master);*/
    pid_t sub;
    for(i = 0; i < process; ++i) {
        /*printf("i = %d\n", i);*/
        if(getpid() == master) {
            sub = fork();
            if(sub != 0) {
                pid_list = shmat(shmP, NULL, 0);
                pid_list[i] = sub;
            }
            if(sub == 0) {
                c = shmat(shmC, NULL, 0);
                pid_list = shmat(shmP, NULL, 0);
            }
        }
    }

    if(getpid() != master) {
        int k;
        int cho = 0;
        for(k = 0; k < process; ++k) {
            if(getpid() == pid_list[k])
                cho = k;
        }
        for(i = 0; i < dimension; ++i) {
            for(j = 0; j < dimension; ++j) {
                if((i*dimension+j) % process == cho)
                    go(i, j, dimension);
            }
        }
        /*for(i = 0; i < dimension; ++i) {*/
            /*for(j = 0; j < dimension; ++j) {*/
                /*printf("%d ", c[i*dimension + j]);*/
            /*}*/
            /*printf("\n");*/
        /*}*/
    }

    if(getpid() != master) {
        shmdt(c);
        shmdt(pid_list);
        exit(0);
    }
    if(getpid() == master) {
        for(i = 0; i < process; ++i) {
            int status;
            waitpid(pid_list[i], &status, 0);
        }
    }
    /*printf("   %d lala\n", getpid());*/
    checksum = 0;
    for(i = 0; i < dimension; ++i) {
        for(j = 0; j < dimension; ++j) {
            checksum += c[i*dimension + j];
            /*printf("%d ", c[i*dimension + j]);*/
        }
    }
    shmdt(c);
    shmdt(pid_list);
    shmctl(shmC, IPC_RMID, NULL);
    shmctl(shmP, IPC_RMID, NULL);
	gettimeofday(&end, 0);
	int sec = end.tv_sec - start.tv_sec;
	int usec = end.tv_usec - start.tv_usec;
	printf("%d-process, checksum = %d\n", process, checksum);
	printf("elapsed %f ms\n", sec * 1000 + (usec / 1000.0));
	return;
}

int main(void)
{
    master = getpid();
    printf("Dimension: ");
    int dim;
    scanf("%d", &dim);
    compute(dim, 1);
    compute(dim, 4);
    return 0;
}
