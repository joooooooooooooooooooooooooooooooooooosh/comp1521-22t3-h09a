#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

// two's complement
//
// 5
// 0000 0101 (0x05)
//
// -5
// 0000 0101
// 1111 1010
// 1111 1011 (0xFB)
//
// 0xffff
// 1111 1111 1111 1111
// 0000 0000 0000 0000
// 0000 0000 0000 0001
//
// 0x8000
// 1000 0000 0000 0000
// 0111 1111 1111 1111
// 1000 0000 0000 0000
//
//
// -100
// 64 + 32 + 4
// 0000 0000 0110 0100 (+100)
// 1111 1111 1001 1011
// 1111 1111 1001 1100 (-100)

int main(int argc, char **argv) {
    int16_t x = 60000;
    printf("%d\n", x);

    int8_t five = 5;
    printf("0x%02X\n", five);
    int8_t minus_five = -5;
    printf("0x%02X\n", minus_five);
    return EXIT_SUCCESS;
}

