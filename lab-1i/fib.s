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
    push {r3, r4, lr}

    cmp r0, #1
    ble .E1
    mov r3, #0
    mov r4, #1
    subs r0, r0, #2

.L1:
    add r3, r4
    cmp r0, #0
    itt eq
    moveq r0, r3
    popeq {r3, r4, pc}
    sub r0, #1
    bl .L2

.L2:
    adds r4, r3
    cmp r0, #0
    itt eq
    moveq r0, r4
    popeq {r3, r4, pc}
    sub r0, #1
    bl .L1


.E1:
    pop {r3, r4, pc}		@ EPILOG


    .size fibonacci, .-fibonacci
    .end
