#include <stdio.h>
#include <stdlib.h>
#include <errno.h>

int main(int argc, char **argv) {
    char *file_path = "g";
    FILE *f = fopen(file_path, "r");
    if (f == NULL) {
        perror(file_path);
        return EXIT_FAILURE;
    }

    char buf[100];
    fread(buf, 100, 1, f);
    if (ferror(f)) {
        perror(file_path);
        return EXIT_FAILURE;
    }



    return EXIT_SUCCESS;
}

