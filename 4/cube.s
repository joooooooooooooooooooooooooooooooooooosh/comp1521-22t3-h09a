        .data
        # shorts are 2 bytes
cube:
        .half 0, 1, 2, 3
        .half 5, 4, 0, 2
        .half 2, 3, 4, 5
        .half 0, 0, 0, 0

        .half 5, 1, 2, 3
        .half 5, 0, 4, 2
        .half 2, 3, 4, 5
        .half 0, 2, 2, 2

        .half 4, 1, 2, 3
        .half 5, 4, 4, 2
        .half 2, 3, 4, 5
        .half 1, 2, 4, 3

        .half 0, 1, 2, 3
        .half 5, 4, 0, 2
        .half 2, 3, 4, 5
        .half 0, 0, 0, 0

        .text
main:
        # nzeroes in $t0
        li      $t0, 0

        # i in $t1
        li      $t1, 0
for_0:
        bge     $t1, 4, end_0

        # j in $t2
        li      $t2, 0
for_1:
        bge     $t2, 4, end_1

        # k in $t3
        li      $t3, 0
for_2:
        bge     $t3, 4, end_2
        
        # if (cube[i][j][k] == 0)
        # step 1: calculate cube[i]
        # &cube[i] = &cube + i * sizeof(short[4][4])
        #                = &cube + i * 4*4*2
        #                = &cube + i * 4*8
        #                = &cube + i * 32

        la      $t4, cube
        mul     $t5, $t1, 32
        add     $t6, $t4, $t5

        # $t6 = &cube[i]

        # step 2: calculate cube[i][j]
        # &cube[i][j] = &cube[i] + j * sizeof(short[4])
        #                = &cube[i] + j * 4*2
        #                = &cube[i] + j * 8
        mul     $t4, $t2, 8
        add     $t7, $t6, $t4

        # step 3: calculate cube[i][j][k]
        # &cube[i][j][k] = &cube[i][j] + k * sizeof(short)
        #                = &cube[i][j] + k * 2
        mul     $t4, $t3, 2
        add     $t6, $t7, $t4

        # $t6 = &cube[i][j][k]
        lh      $t4, ($t6)
        # $t4 = cube[i][j][k]

        bnez    $t4, not_if_0

        addi    $t0, $t0, 1

not_if_0:
        # k++
        addi    $t3, $t3, 1
        b       for_2
end_2:

        # j++
        addi    $t2, $t2, 1
        b       for_1
end_1:

        # i++
        addi    $t1, $t1, 1
        b       for_0
end_0:

        # printf("%d\n", nzeroes);
        li      $v0, 1
        move    $a0, $t0
        syscall

        li      $v0, 11
        li      $a0, '\n'
        syscall

        # return 5 (no reason)
        li      $v0, 5
        jr      $ra
