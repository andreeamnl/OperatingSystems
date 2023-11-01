org 7c00H   ; Set the origin address to 0x7C00, a common starting point for bootloaders

chr db 'YES' ; Define a data section with the string 'YES'

go:
    mov AX, 0H   ; Clear AX register (unnecessary but common in bootloaders)
    mov ES, AX   ; Set ES (Extra Segment) to 0 (the default data segment)

    mov AX, 1301H ; Load 0x1301 into AX. This is a function code for setting a specific video mode.
    mov BH, 0     ; Clear BH (often used for the video page)
    mov BL, 04H   ; Set BL to 0x04, which specifies a red color attribute
    mov CX, 3     ; Set CX to 3, indicating that three characters will be written
    mov DH, 0     ; Clear DH (often used for the row position)
    mov DL, 0     ; Clear DL (often used for the column position)
    mov BP, chr   ; Load the address of the 'chr' variable (string) into BP

    int 10h       ; Invoke interrupt 10h (INT 10h), which calls the BIOS video service
                  ; to perform the specified video mode setup and write the string "YES" to the screen.

jmp $          ; This creates an infinite loop, causing the program to hang indefinitely.
