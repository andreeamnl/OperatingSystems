org 7c00H   ; Set the origin address to 0x7C00, a common starting point for bootloaders

chr db 'H', 36H, 'Y', 37H ; Define a data section with characters and their hexadecimal values

go:
    mov AX, 0H   ; Clear AX register (unnecessary but common in bootloaders)
    mov ES, AX   ; Set ES (Extra Segment) to 0 (the default data segment)

    mov AX, 1302H ; Load 0x1302 into AX. This is a function code for setting a specific video mode.
    mov BH, 0     ; Clear BH (often used for the video page)
    mov CX, 2     ; Set CX to 2, indicating that two characters will be written
    mov DH, 0     ; Clear DH (often used for the row position)
    mov DL, 0     ; Clear DL (often used for the column position)
    mov BP, chr   ; Load the address of the 'chr' variable into BP

    int 10h       ; Invoke interrupt 10h (INT 10h), which calls the BIOS video service
                  ; to perform the specified video mode and character writing.

jmp $          ; This creates an infinite loop, causing the program to hang indefinitely.
