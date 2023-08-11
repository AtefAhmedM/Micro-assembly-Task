.386
.model flat, stdcall 
.stack 4096
ExitProcess proto,dwExitCode:dword
.data
ORG 500H 
data1 db 20h, 15h, 60h, 55h, 03h

org 600h
oddN Db ?

 .code

main proc
mov  eax,0
mov ebx,0
mov ecx,0
mov esi,0
mov edx,0

mov esi,offset data1
mov cx, 05h

 do:
 mov al, byte ptr[esi]

 rcr al,1
 inc esi
 adc dl,0
 cmp dl, 1
 je ad

dec cx
cmp cx, 0
jne do

jmp finish

 ad:
inc bl
mov dl,0

dec cx
cmp cx,0
jne do


finish:
mov cx, 05h
mov esi,offset data1
mov dl,0
mov edi,offset oddN
mov byte ptr[oddN],bl
make:
mov al, byte ptr[esi]
 ror al,5
 inc esi
 adc dl, 0
 cmp dl, 1
 je addd

dec cx
cmp cx, 0
jne make

jmp endF

addd:
inc bl
mov dl,0

dec cx
cmp cx,0
jne make

endF:

mov edi,offset oddN
mov byte ptr[oddN+2],bl

	call ExitProcess
main endp
end main
