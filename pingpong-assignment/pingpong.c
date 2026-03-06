#include <stdio.h>
#include <unistd.h>
#include <sys/time.h>
#include <sys/wait.h>

#define ITERATIONS 1000000

int main() {

    int pipe1[2];
    int pipe2[2];
    char byte = 'a';

    pipe(pipe1);
    pipe(pipe2);

    int pid = fork();

    if (pid == 0) {
        // Child process
        for (int i = 0; i < ITERATIONS; i++) {
            read(pipe1[0], &byte, 1);
            write(pipe2[1], &byte, 1);
        }
    } 
    else {
        struct timeval start, end;

        gettimeofday(&start, NULL);

        for (int i = 0; i < ITERATIONS; i++) {
            write(pipe1[1], &byte, 1);
            read(pipe2[0], &byte, 1);
        }

        gettimeofday(&end, NULL);

        wait(NULL);

        double time =
        (end.tv_sec - start.tv_sec) +
        (end.tv_usec - start.tv_usec) / 1000000.0;

        double exchanges = ITERATIONS / time;

        printf("Total time: %f seconds\n", time);
        printf("Exchanges per second: %f\n", exchanges);
    }

    return 0;
}
