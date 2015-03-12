    .syntax unified
    .arch armv7-a
    .text
    .align 2
    .thumb
    .thumb_func

    .global fibonacci
    .type fibonacci, function

fibonacci:
    @ ADD/MODIFY CODE BELOW
    @ PROLOG
	push {r3, r4, r5, lr}

    cmp r0, #1
    ble .E1
    mov r3, #0
    mov r4, #1
    subs r0, r0, #2
.L:
    adds r5, r3, r4
    cmp r0, #0
    itt eq
    moveq r0, r5
    popeq {r3, r4, r5, pc}
    subs r0, r0, #1
    mov r3, r4
    mov r4, r5
    bl .L

.E1:
    pop {r3, r4, r5, pc}		@ EPILOG


    .size fibonacci, .-fibonacci
    .end
