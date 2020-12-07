section .data
    text1 db "Please enter a letter from A to E: ",10
    text2 db "You entered: "
    text3 db "Incorrect value entered. Program terminating. ",10
    textA db "In A.",10
    textB db "In B.",10
    textC db "In C.",10
    textD db "In D.",10
    textE db "In E.",10
    textGreat db "Good job.",10

section .bss
    letter resb 16

section .text
    global _start

_start:
    call _printText1
    call _getLetter
    call _printText2
    call _printLetter
    call _isA
    call _printText2

    mov ax, 60
    mov di, 0
    syscall

_printText1:
    mov ax, 1
    mov di, 1
    mov si, text1
    mov dx, 35
    syscall
    ret

_getLetter:
    mov ax, 0
    mov di, 0
    mov si, letter
    mov dx, 16
    syscall
    ret

_printText2:
    mov ax, 1
    mov di, 1
    mov si, text2
    mov dx, 13
    syscall
    ret

_printLetter:
    mov ax, 1
    mov di, 1
    mov si, letter
    mov dx, 16
    syscall
    ret

_isA:
    mov ax,1
    mov di,1
    mov si, textA
    mov dx, 6
    syscall

    mov si, letter
    cmp si, "A"
    jnz isB
    jz great

isB:
    mov ax, 1
    mov di, 1
    mov si, textB
    mov dx, 6
    syscall

    mov si, letter
    cmp si, 66
    jnz isC
    jz great

isC:
    mov si, letter
    cmp si, 67
    jnz isD
    jz great

isD:
    mov si, letter
    cmp si, 68
    jnz isE
    jz great

isE:
    mov si, letter
    cmp si, 69
    jnz terminateFail
    jz great

terminateFail:
    mov ax, 1
    mov di, 1
    mov si, text3
    mov dx, 47
    syscall

    mov ax, 60
    mov di, 0
    syscall

great:
    mov ax, 1
    mov di, 1
    mov si, textGreat
    mov dx, 9
    syscall

    mov ax, 60
    mov di,0
    syscall
