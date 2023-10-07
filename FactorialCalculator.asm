.386
.model flat, stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword
.data
ORG 500H
num dd 5            ; Change this value to calculate factorial for a different number
result dd ?

.code

main proc
    push ebp
    mov ebp, esp

    ; Initialize variables
    mov eax, [num]     ; Load the number into eax
    mov ebx, 1         ; Initialize ebx to 1 (counter)
    mov ecx, 1         ; Initialize ecx to 1 (result)

    ; Check if the number is zero
    cmp eax, 0
    je done

    ; Calculate factorial recursively
    call factorial

done:
    ; Store the result in the 'result' variable
    mov [result], ecx

    ; Exit the program
    push 0
    call ExitProcess

factorial proc
    ; Recursive function to calculate factorial
    ; Input: ebx (counter), ecx (result)
    ; Output: ecx (result)

    ; Base case: if ebx == 0, return
    cmp ebx, 0
    je fact_done

    ; Multiply result by counter
    imul ecx, ebx

    ; Decrement counter
    dec ebx

    ; Recursive call
    call factorial

fact_done:
    ret
factorial endp

main endp
end main
