        .text
SQUARE_MAX = 46340

main:
        # v0 needs 4, a0 needs &string
        li      $v0, 4
        la      $a0, prompt_string
        syscall

        # t0 holds x
        li      $v0, 5
        syscall
        move    $t0, $v0

        # if (x <= SQUARE_MAX)
        ble     $t0, SQUARE_MAX, else_label
if_label:
        li      $v0, 4
        la      $a0, too_big_string
        syscall

        b       end_label
        # j       end_label
else_label:
        # t1 holds y
        mul     $t1, $t0, $t0

        # printf("%d")
        li      $v0, 1
        move    $a0, $t1
        syscall

        # printf("\n")
        li      $v0, 11
        li      $a0, '\n' # li      $a0, 10
        syscall

end_label:
        li      $v0, 0
        jr      $ra

        .data
prompt_string:
        .asciiz "Enter a number: "
too_big_string:
        .asciiz "square too big for 32 bits\n"
