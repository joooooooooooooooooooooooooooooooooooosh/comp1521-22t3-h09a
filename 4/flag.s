FLAG_ROWS = 6
FLAG_COLS = 12

main:
        # row in t0, col in t1
        li      $t0, 0

main__for_1_start:
        bge     $t0, FLAG_ROWS, main__for_1_end

        li      $t1, 0
main__for_2_start:
        bge     $t1, FLAG_COLS, main__for_2_end

        # find addr of elem in array
        # addr = start + index * sizeof(element)
        la      $t2, flag
        mul     $t3, $t0, FLAG_COLS # FLAG_COLS * 1
        add     $t4, $t2, $t3

        # addr = start + index * sizeof(element)
        # start is $t4
        mul     $t5, $t1, 1
        add     $t6, $t4, $t5
        
        lb      $a0, ($t6)
        li      $v0, 11
        syscall

        addi    $t1, $t1, 1
        b       main__for_2_start
main__for_2_end:
        li      $v0, 11
        li      $a0, '\n'
        syscall
        
        addi    $t0, $t0, 1
        b       main__for_1_start
main__for_1_end:
        jr      $ra

.data

flag:
    .byte '#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#'
    .byte '#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#'
    .byte '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.'
    .byte '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.'
    .byte '#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#'
    .byte '#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#'
