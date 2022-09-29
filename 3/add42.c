// A simple program that adds 42 to each element of an array

#include <stdio.h>
#define N_SIZE 10

int main(void) {
    int i;
    int numbers[N_SIZE] = {0, 1, 2, -3, 4, -5, 6, -7, 8, 9};

    i = 0;
    while (i < N_SIZE) {
        if (numbers[i] < 0) {
            numbers[i] += 42;
        }

        printf("%d\n", numbers[i]);
        i++;
    }
}
