org 7c00H
go:
    mov AH, 0eh     ; Function code for Write Character as TTY
    mov AL, 57h     ; The character to write (Change 'A' to the desired character)
    int 10h         ; Call the BIOS video interrupt


jmp $