#include <stdio.h>

int main(int argc, char *argv[]) {
	printf("%p\n", argv);
	printf("argc=%d\n", argc);
	for (int i = 0; i < argc; i++) {
		printf("argv[%d] = %p\n", i, argv[i]);
		printf("argv[%d]=%s\n", i, argv[i]);
	}
}
