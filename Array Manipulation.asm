.386
.model flat, stdcall
.stack 4096
ExitProcess proto, dwExitCode: dword

.data
ORG 500H
array1 dd 10, 20, 30, 40, 50
array2 dd 0, 0, 0, 0, 0
array_size equ 5

.code
main proc
    mov  eax, 0
    mov  ebx, 0
    mov  ecx, 0
    mov  esi, 0

    mov  esi, offset array1
    mov  ecx, array_size

calculate_squares:
    mov  eax, [esi]        ; Load a value from array1
    imul eax, eax          ; Square the value
    mov  [esi], eax        ; Store the squared value back in array1
    add  esi, 4            ; Move to the next element
    loop calculate_squares ; Repeat for all elements

    mov  esi, offset array1
    mov  edi, offset array2
    mov  ecx, array_size

copy_array:
    mov  eax, [esi]        ; Load a value from array1
    mov  [edi], eax        ; Copy the value to array2
    add  esi, 4            ; Move to the next element in array1
    add  edi, 4            ; Move to the next element in array2
    loop copy_array        ; Repeat for all elements

    call ExitProcess

main endp
end main
