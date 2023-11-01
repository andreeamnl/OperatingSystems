org 7c00H   ; Set the origin address to 0x7C00, which is common for bootloaders

go:
    mov AH, 0aH   ; Set AH to 0x0A, which is the function code for Write Character at Cursor
    mov AL, 57h   ; Set AL to the ASCII code for 'W' (0x57)

    mov BH, 0     ; Clear BH (video page), often set to 0 for the default page

    int 10h       ; Call interrupt 10h (INT 10h), which invokes the BIOS video service
                  ; to write the character to the screen.

jmp $          ; This creates an infinite loop, causing the program to hang indefinitely.

;nasm -f bin -o eight.bin m8.asm