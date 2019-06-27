.section .init
.globl _start

_start:
ldr r0,=0x20200000

/*
 * On the Raspberry Pi Zero (W), pin 47 is used
 * to control the activity LED.
 *
 * Enables output for pin 47.
 *
 * From the specification(p.90, Table 6-5), bit 21 must be set to 1 for output.
 *
 * [0-9] 1st + 4 bytes
 * [10-19] 2nd + 4 bytes
 * [20-29] 3rd + 4 bytes
 * [30-39] 4th + 4 bytes
 * [40-49] 5th
 *
 * Pin 47 are is in the 5th set
 * => add 16 to the address of the controller 
 */ 
mov r1,#1
lsl r1,#21
str r1,[r0, #16]

loop$:
b loop$

