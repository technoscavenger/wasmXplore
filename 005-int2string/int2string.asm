.386
.model flat, stdcall
option casemap :none
include \masm32\include\windows.inc
include \masm32\include\kernel32.inc
include \masm32\include\masm32.inc
includelib \masm32\lib\kernel32.lib
includelib \masm32\lib\masm32.lib

.data
        buffer DB 11 DUP(0)
        ;value DWORD 4294967295
        value DWORD 2147483647

.code
start:
        invoke dwtoa, value, addr buffer
        invoke StdOut, addr buffer
        invoke ExitProcess, 0
end start