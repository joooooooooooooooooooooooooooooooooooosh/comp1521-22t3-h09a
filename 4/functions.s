main:
main__prologue:
        begin
        push    $ra # addi $sp, $sp, -4
                    # lw   $ra, ($sp)
        push    $s0
main__body:
        li      $s0, 3 # ensure mips conventions

        li      $a0, 11
        li      $a1, 13
        li      $a2, 17
        li      $a3, 19
        jal     sum4
        move    $a0, $v0

        li      $v0, 1
        syscall


        ## print $s0
        li      $v0, 11
        li      $a0, '\n'
        syscall

        li      $v0, 1
        move    $a0, $s0
        syscall

        li      $v0, 0
main__epilogue:
        pop     $s0
        pop     $ra
        end
        jr      $ra


sum4:
sum4__prologue:
        begin
        push    $ra
        push    $s0
sum4__body:
        jal     sum2
        move    $s0, $v0
        
        move    $a0, $a2
        move    $a1, $a3
        jal     sum2

        move    $a0, $s0
        move    $a1, $v0
        jal     sum2

sum4__epilogue:
        pop     $s0
        pop     $ra
        end
        jr      $ra


sum2:
sum2__prologue:
        begin
        push    $s0
sum2__body:
        addi    $s0, $s0, 1 # modifying s0 for no reason
        add     $v0, $a0, $a1

sum2__epilogue:
        pop     $s0
        end
        jr      $ra
