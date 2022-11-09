#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(int argc, char **argv) {
    char *home;
    home = getenv("HOME");
    char *diary = "/.diary";
    // add 1 extra byte for null terminator
    int len = strlen(home) + strlen(diary) + 1;
    char *path = malloc(len);
    snprintf(path, len, "%s%s", home, diary);

    printf("%s\n", path);
    return EXIT_SUCCESS;
}

