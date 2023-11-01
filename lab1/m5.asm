org 7c00H   ; Set the origin address to 0x7C00, a common starting point for bootloaders

chr db 'A', 25H ; Define a data section with the character 'A' and its hexadecimal attribute value

go:
    mov AX, 0H   ; Clear AX register (unnecessary but common in bootloaders)
    mov ES, AX   ; Set ES (Extra Segment) to 0 (the default data segment)

    mov AX, 1303H ; Load 0x1303 into AX. This is a function code for setting a specific video mode.
    mov BH, 0     ; Clear BH (often used for the video page)
    mov CX, 1     ; Set CX to 1, indicating that one character will be written
    mov DH, 0     ; Clear DH (often used for the row position)
    mov DL, 0     ; Clear DL (often used for the column position)
    mov BP, chr   ; Load the address of the 'chr' variable into BP

    int 10h       ; Invoke interrupt 10h (INT 10h), which calls the BIOS video service
                  ; to perform the specified video mode and character writing.

jmp $          ; This creates an infinite loop, causing the program to hang indefinitely.
