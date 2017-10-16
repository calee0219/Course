#include <stdio.h>
#include <sys/types.h>
#include <unistd.h>
#include <sys/wait.h>

int main(void)
{
    pid_t me = getpid();
    printf("Main Process ID : %d\n\n", me);
    int status = 0;
    pid_t child = fork();
    if(child == 0) {
        /*pid_t lv1 = getpid();*/
        pid_t lv2_1 = -1, lv2_2 = -1;
        pid_t lv3_1 = -1, lv3_2 = -1;
        printf("Fork 1. I'm the child %d, my parent is %d\n", getpid(), getppid());
        lv2_1 = fork();
        if(lv2_1 != 0) lv2_2 = fork();
        if(lv2_1 == 0) {
            printf("Fork 2. I'm the child %d, my parent is %d\n", getpid(), getppid());
        }
        if(lv2_2 == 0) {
            printf("Fork 2. I'm the child %d, my parent is %d\n", getpid(), getppid());
        }
        if(lv2_1 == 0) {
            lv3_1 = fork();
            if(lv3_1 == 0) {
                printf("Fork 3. I'm the child %d, my parent is %d\n", getpid(), getppid());
            }
            wait(&status);
        }
        if(lv2_2 == 0) {
            lv3_2 = fork();
            if(lv3_2 == 0) {
                printf("Fork 3. I'm the child %d, my parent is %d\n", getpid(), getppid());
            }
            wait(&status);
        }
        if(lv2_1 != 0 && lv2_2 != 0) {
            waitpid(lv2_1, &status, 1);
            waitpid(lv2_2, &status, 1);
        }
    } else {
        waitpid(child, &status, 1);
    }
    return 0;
}
