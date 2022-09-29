N_SIZE = 10

main:
        # i in $t0
        li      $t0, 0
main__while_start:
        bge     $t0, N_SIZE, main__while_end

        # this also works:
        # la      $t1, numbers
        # mul     $t3, $t0, 4
        # add     $t2, $t1, $t3
        # lw      $a0, ($t2)

        mul     $t1, $t0, 4
        lw      $t2, numbers($t1)

        bgez    $t2, main__if_false

        addi    $t2, $t2, 42
        sw      $t2, numbers($t1)

main__if_false:

        mul     $t1, $t0, 4
        lw      $a0, numbers($t1)
        li      $v0, 1
        syscall

        li      $v0, 11
        li      $a0, '\n'
        syscall
        
        addi    $t0, $t0, 1
        b       main__while_start

main__while_end:
        li      $v0, 0
        jr      $ra

        .data
numbers:
        .word 0, 1, 2, -3, 4, -5, 6, -7, 8, 9
