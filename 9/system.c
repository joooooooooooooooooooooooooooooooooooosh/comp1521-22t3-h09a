#include <stdio.h>
#include <stdlib.h>

int main(int argc, char **argv) {
    char *dcc = "dcc";
    char *cmd = malloc(1000);
    snprintf(cmd, 1000, "%s %s", dcc, argv[1]);
    system(cmd);
    return EXIT_SUCCESS;
}

