#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>

void *thread_run(void *data) {
    while (1) {
        printf("Hello\n");
    }
}

int main(int argc, char **argv) {
    pthread_t thread;
    pthread_create(&thread, NULL, thread_run, NULL);

    while (1) {
        printf("there!\n");
    }
    return EXIT_SUCCESS;
}

