org 7c00H



go:
    mov AX, 0H     ; Initialize AX to 0 (This step is not strictly necessary)
    mov ES, AX     ; Set the ES (Extra Segment) register to 0

    mov AX, 0xb800 ; Load 0xB800 into AX. This is the video memory segment for text mode.
    mov AH, 0eh    ; Set AH to 0x0E, which is the function code for Write Character as TTY.
    mov AL, 57h    ; Load AL with the character 'W' (in ASCII, 57h corresponds to 'W')

    mov WORD [es:bx], ax ; Write the character (AL) and attribute (AH) to the video memory
                        ; location pointed to by ES:BX. In text mode, video memory
                        ; alternates between a character byte and an attribute byte, so
                        ; we store both in a single 16-bit word.

    int 10h         ; Call interrupt 10h (INT 10h), which invokes the BIOS video service
                    ; to write the character to the screen.

jmp $            ; This creates an infinite loop, causing the program to hang indefinitely.
