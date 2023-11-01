org 7c00H   ; Set the origin address to 0x7C00, which is common for bootloaders

go:
    mov AH, 09h  ; Set AH to 0x09, which is the function code for Display String
    mov AL, 57h  ; Set AL to the ASCII code for 'W' (0x57)
    mov BH, 0    ; Set BH (page number) to 0 (often used for the default video page)
    mov BL, 0dH  ; Set BL to 0x0D, which is the display attribute (foreground and background colors)
    mov CX, 3    ; Set CX to 3, which specifies the number of times to repeat the character 'W'

    int 10h      ; Call interrupt 10h (INT 10h), which invokes the BIOS video service
                 ; to display the character 'W' three times with the specified attributes.

jmp $          ; This creates an infinite loop, causing the program to hang indefinitely.
