#include <stdio.h>

// shorts are 2 bytes
// cube contains 14 zeroes
short cube[4][4][4] = {
    // 6 zeroes
    {
        {0, 1, 2, 3},
        {5, 4, 0, 2},
        {2, 3, 4, 5},
        {0, 0, 0, 0}
    },
    // 2 zeroes
    {
        {5, 1, 2, 3},
        {5, 0, 4, 2},
        {2, 3, 4, 5},
        {0, 2, 2, 2}
    },
    // 0 zeroes
    {
        {4, 1, 2, 3},
        {5, 4, 4, 2},
        {2, 3, 4, 5},
        {1, 2, 4, 3}
    },
    // 6 zeroes
    {
        {0, 1, 2, 3},
        {5, 4, 0, 2},
        {2, 3, 4, 5},
        {0, 0, 0, 0}
    }
};

// short one[4] = {0, 1, 2, 3} 
// sizeof(short[4]) = 4 * sizeof(short) = 8
//
// short two[4][4] = 4 * short[4]
// sizeof(short[4][4]) = 4 * sizeof(short[4]) = 32
//
// short three[4][4][4] = 4 * short[4][4]
// sizeof(short[4][4][4]) = 4 * sizeof(short[4][4]) = 128

int main() {
    int nzeroes = 0;
    for (int i = 0; i < 4; i++)
        for (int j = 0; j < 4; j++)
            for (int k = 0; k < 4; k++)
                if (cube[i][j][k] == 0)
                    nzeroes++;

    // return 5 because why not
    printf("%d\n", nzeroes);
    return 5;
}
