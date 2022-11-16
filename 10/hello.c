#include <stdio.h>
#include <pthread.h>

void *thread_run(void *_data) {
    char *data = (char *)_data;
    printf("Hello from thread! args are %s\n", data);

    return (void *)5;
}

int main(void) {
    pthread_t thread;
    pthread_create(
        &thread,    // the pthread_t handle that will represent this thread
        NULL,       // thread-attributes -- we usually just leave this NULL
        thread_run, // the function that the thread should start executing
        "my_string" // data we want to pass to the thread -- this will be
                    // given in the `void *data` argument above
    );

    int retval;
    if (pthread_join(thread, (void *)&retval)) {
        perror("join");
        return 1;
    }

    printf("thread returned %d\n", retval);

    return 0;
}
