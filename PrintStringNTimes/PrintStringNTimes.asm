;Yanal Yahya 197
format PE console
entry start

include 'win32a.inc'


section '.data' data readable writable

        strEnter   db 'enter a number: ', 0
        strPrint db 'Yanal Yahya 197', 10, 0
        strScanInt   db '%d', 0
        num dd 0
        i dd 0;

section '.code' code readable executable

start:
        push strEnter
        call [printf]
        add esp, 4

        push num
        push strScanInt
        call [scanf]
        add esp, 8

        mov edx, [num]
        mov [i], edx

   for:
        cmp [i],0
        je finish
        push strPrint
        call [printf]
        add esp, 4
        dec [i]
        jmp for

finish:
        call [getch]
        push 0
        call [ExitProcess]


section '.idata' import data readable
    library kernel, 'kernel32.dll',\
            msvcrt, 'msvcrt.dll',\
            user32,'USER32.DLL'

include 'api\user32.inc'
include 'api\kernel32.inc'
    import kernel,\
           ExitProcess, 'ExitProcess',\
           HeapCreate,'HeapCreate',\
           HeapAlloc,'HeapAlloc'
  include 'api\kernel32.inc'
    import msvcrt,\
           printf, 'printf',\
           scanf, 'scanf',\
           getch, '_getch'
