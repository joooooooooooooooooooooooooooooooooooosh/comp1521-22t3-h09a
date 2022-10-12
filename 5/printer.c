#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

uint8_t printerControl = 0; // 0b 1101 0000

// Whether the printer is out of ink
#define NO_INK (0x01)       // 0b 0000 0001
// Whether to print/scan in colour
#define COLOUR (0x2)        // 0b 0000 0010
// Select print mode
#define SELECT_PRINT (0x4)  // 0b 0000 0100
// Select scan mode
#define SELECT_SCAN (0x8)   // 0b 0000 1000
// Start print/scan
#define START (0x10)        // 0b 0001 0000

void check_out_of_ink() {
    // check if NO_INK has been set
    // &
    uint8_t result = printerControl & NO_INK;
    if (result != 0) {
        puts("Out of ink!");
    }
}

void set_colour_and_scan() {
    printerControl |= (COLOUR | SELECT_SCAN);
}

void toggle_print_scan() {
    // Select print mode
    // 0b 0000 0100
    // Select scan mode
    // 0b 0000 1000
    //
    // PRINT | SCAN
    // 0b 0000 1100
    // printerControl
    // 0b 0101 0100
    // 0b 0101 1000
    printerControl ^= (SELECT_PRINT | SELECT_SCAN);
}

int main(int argc, char **argv) {
    check_out_of_ink();
    // set NO_INK
    // |
    printerControl |= NO_INK;
    check_out_of_ink();
    // toggle NO_INK off
    // ^
    printerControl ^= NO_INK;
    check_out_of_ink();

    printf("0x%04x\n", printerControl);
    set_colour_and_scan();
    printf("0x%04x\n", printerControl);
    toggle_print_scan();
    printf("0x%04x\n", printerControl);

    return EXIT_SUCCESS;
}
