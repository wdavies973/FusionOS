; This is the "master boot record". The BIOS will run this 512-byte sector of code that's located at the beginning
; of the disk. This is called the "boot loader". It's responsible for loading the operating system.
; The BIOS uses a boot manager to insert the correct code here based on the operating system. This will call a better
; boot loader that will actually load the OS.

; This code also will specify partitions. Partitions do just what they sound like they do - they partition the drive into separate components
; to serve multiple purposes.

; The CPU has a real simple character mode for outputting values

mov ah, 0x0e ; Interrupt 10h needs a value in AH/AL/AX to know what to do. To print characters, this is AH 0x0e
mov al, 'H' ; Moves 'H' into register al
int 0x10
mov al, 'e'
int 0x10
mov al, 'l'
int 0x10
mov al, 'o'
int 0x10

jmp $ ; '$' means the current address position (the address where next instruction/data would be assembled), this literally gives the kernel something to do

times 510 - ($-$$) db 0 ; '$$' means the address position of the beginning of the current section
dw 0xaa55

; 'db' - define byte (8 bits), 'dw' - define word (generally 2 bytes), 'dd' double word (generally 4 bytes)