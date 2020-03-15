.386
.model flat, stdcall
option casemap :none
include \masm32\include\windows.inc
include \masm32\include\kernel32.inc
include \masm32\include\masm32.inc
includelib \masm32\lib\kernel32.lib
includelib \masm32\lib\masm32.lib

dwtoa2 proto :DWORD, :DWORD

.data
        msg1    DB "Max DWORD : ", 0
        msg2    DB 13,10,"Zero : ",0 ;13=CR, 10=LF
        buffer1 DB 10 DUP(0)
        buffer2 DB 10 DUP(0)
        max_dword DWORD 4294967295
        

.code
start:
        invoke dwtoa2, max_dword, addr buffer1
        invoke StdOut, addr msg1
        invoke StdOut, addr buffer1
        invoke dwtoa2, 0, addr buffer2
        invoke StdOut, addr msg2
        invoke StdOut, addr buffer2
        invoke ExitProcess, 0

        dwtoa2 proc dwValue:DWORD, lpBuffer:DWORD

            ; -------------------------------------------------------------
            ; convert DWORD to ascii string
            ; dwValue is value to be converted
            ; lpBuffer is the address of the receiving buffer
            ; EXAMPLE:
            ; invoke dwtoa2,edx,ADDR buffer
            ;
            ; Uses: eax, ecx, edx.
            ; -------------------------------------------------------------

            push ebx
            push esi
            push edi

            mov eax, dwValue
            mov edi, [lpBuffer]

            test eax,eax
            jnz notzero

          zero:
            mov word ptr [edi],30h
            jmp dtaexit

          notzero:
            ;https://en.wikipedia.org/wiki/Division_algorithm
            mov ecx, 3435973837
            mov esi, edi

            .while (eax > 0)
              mov ebx,eax
              mul ecx
              shr edx, 3
              mov eax,edx
              lea edx,[edx*4+edx]
              add edx,edx
              sub ebx,edx
              add bl,'0'
              mov [edi],bl
              add edi, 1
            .endw

            mov byte ptr [edi], 0       ; terminate the string

            ; We now have all the digits, but in reverse order.

            .while (esi < edi)
              sub edi, 1
              mov al, [esi]
              mov ah, [edi]
              mov [edi], al
              mov [esi], ah
              add esi, 1
            .endw

          dtaexit:

            pop edi
            pop esi
            pop ebx

            ret

        dwtoa2 endp

end start