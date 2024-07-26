INCLUDE Irvine32.inc
.data
intro BYTE "WELCOME TO SNAKES AND LADDERS!",0
diceprompt byte "ROLL THE DICE",0
diceroll byte "ROLLING DICE",0
dots byte ".",0
dicenum byte "Dice roll=",0
ladder byte "ladder //",0
snake byte "X SNAKE X",0
congrats byte "CONGRATULATIONS!!!! PLAYER WON!!!",0
_position byte "Current position=",0
playernum byte "Player num:",0
_defcol byte "1:RED 2:BLUE 3:GREEN 4:YELLOW",0  
playerpos DWORD 4 DUP(0)
pldisp byte "PLAYER ",0
pldisp2 byte " POSITION:",0
shake byte "Shake the dice=",0

gaps byte "   ",0
_temp dword 0
_test byte "***",0
_div byte '|',0
_s1 byte "S1",0
_s2 byte "S2",0
_s3 byte "S3",0
_s4 byte "S4",0
_s5 byte "S5",0
_s6 byte "S6",0
_s7 byte "S7",0
_l1 byte "L1",0
_l2 byte "L2",0
_l3 byte "L3",0
_l4 byte "L4",0
_l5 byte "L5",0
_l6 byte "L6",0
_l7 byte "L7",0
_l8 byte "L8",0


.code
main PROC

call PrintBorder
call PrintNums
call PrintLadders
call PrintSnakes


mov ebx,0
call _start
;call display

exit
main ENDP


posdisp PROC

call crlf
mov edx, offset _defcol
call writestring
call crlf
mov edi,offset playerpos 
mov ecx,4
mov ebx,1
l2:
mov eax,ebx
mov edx,offset pldisp
call writestring
call writedec
mov edx,offset pldisp2
call writestring
mov eax,[edi]
call writedec
inc ebx
add edi,4
mov al,' '
call writechar
call writechar
call writechar
loop l2
call crlf
ret

posdisp ENDP

_start PROC

mov edx,offset intro
call writestring
call crlf
mov ecx,0 
mov edi,offset playerpos
mov esi,0

_rolling:

call crlf
mov [edi+esi],ebx
cmp ecx,4
jne indexing

pushad
pushfd
call clrscr
mov dh,11
mov dl,0
call gotoxy
call posdisp
call PrintBorder
call PrintNums
call PrintLadders
call PrintSnakes
call UpdatePos
mov dh,15
mov dl,0
call gotoxy
popfd
popad

mov ecx,0
mov esi,0
jmp proceed

indexing:
cmp ecx,0
je proceed
add esi,4

proceed:
inc ecx
mov eax,ecx
mov edx,offset playernum
call writestring
call writedec
call crlf


mov edx,offset _position
call writestring
mov ebx,[edi+esi]
mov eax,ebx
call writedec
call crlf


mov edx,offset diceprompt
call writestring
call readchar
call crlf 

mov edx,offset diceroll
call writestring
push ecx
mov ecx,3
l1:
mov eax,200
call delay
mov edx,offset dots
call writestring
loop l1
call crlf
pop ecx

mov eax,6
call randomize
call randomrange
inc eax
mov edx,offset dicenum
call writestring
call writedec
call crlf

add ebx,eax

;comparisons for snakes and ladders
_cmpexceed:
cmp ebx,100
jng _cmpdone
sub ebx,eax
jmp _rolling

_cmpdone:
cmp ebx,100
jne _cmp1
mov edx,offset playernum
call writestring
mov eax,ecx
call writedec
call crlf
mov edx,offset congrats
call writestring
jmp _finn
r8:
;mov al,'*'
;call writechar
jmp _rolling

_cmp1:
cmp ebx,1
jne _cmp2
mov ebx,38
;call dumpregs
mov edx,offset ladder
call writestring
call crlf
jmp _rolling
r7:
;mov al,'*'
;call writechar
jmp r8

_cmp2:
cmp ebx,4
jne _cmp3
mov ebx,14
;call dumpregs
mov edx,offset ladder
call writestring
call crlf
jmp _rolling

_cmp3:
cmp ebx,8
jne _cmp4
mov ebx,10
;call dumpregs
mov edx,offset ladder
call writestring
call crlf
jmp _rolling

_cmp4:
cmp ebx,21
jne _cmp5
mov ebx,42
;call dumpregs
mov edx,offset ladder
call writestring
call crlf
jmp _rolling
r6:
;mov al,'*'
;call writechar
jmp r7

_cmp5:
cmp ebx,28
jne _cmp6
mov ebx,76
;call dumpregs
mov edx,offset ladder
call writestring
call crlf
jmp _rolling

_cmp6:
cmp ebx,50
jne _cmp7
mov ebx,67
;call dumpregs
mov edx,offset ladder
call writestring
call crlf
jmp _rolling
r5:
;mov al,'*'
;call writechar
jmp r6

_cmp7:
cmp ebx,71
jne _cmp8
mov ebx,92
;call dumpregs
mov edx,offset ladder
call writestring
call crlf
jmp _rolling

_cmp8:
cmp ebx,80
jne _scmp9
mov ebx,99
;call dumpregs
mov edx,offset ladder
call writestring
call crlf
jmp _rolling

_scmp9:
cmp ebx,32
jne _scmp10
mov ebx,10
;call dumpregs
mov edx,offset snake
call writestring
call crlf
jmp _rolling
r4:
;mov al,'*'
;call writechar
jmp r5

_scmp10:
cmp ebx,34
jne _scmp11
mov ebx,6
;call dumpregs
mov edx,offset snake
call writestring
call crlf
jmp _rolling

_scmp11:
cmp ebx,48
jne _scmp12
mov ebx,26
;call dumpregs
mov edx,offset snake
call writestring
call crlf
jmp _rolling
r3:
;mov al,'*'
;call writechar
jmp r4

_scmp12:
cmp ebx,62
jne _scmp13
mov ebx,18
;call dumpregs
mov edx,offset snake
call writestring
call crlf
jmp _rolling

_scmp13:
cmp ebx,88
jne _scmp14
mov ebx,24
;call dumpregs
mov edx,offset snake
call writestring
call crlf
jmp _rolling
r2:
;mov al,'*'
;call writechar
jmp r3

_scmp14:
cmp ebx,95
jne _scmp15
mov ebx,56
;call dumpregs
mov edx,offset snake
call writestring
call crlf
jmp _rolling

_scmp15:
cmp ebx,97
jne r2
mov ebx,78
;call dumpregs
mov edx,offset snake
call writestring
call crlf
jmp r2

_finn:
ret
_start endp

UpdatePos PROC
mov edi, offset playerpos
mov edx,0
call gotoxy

mov ax,[edi]
dec ax
mov bl,10
div bl
mov dh,9
sub dh,al
test al,1
jnz _ulta1
mov dl,ah
jmp _move1

_ulta1:
mov dl,10
sub dl,ah
dec dl
_move1:
add dl,dl
add dl,dl
inc dl
call gotoxy
mov al,01000000b
call settextcolor
mov edx,offset gaps
call writestring

;PLAYER2
mov edx,0
add edi,4
call gotoxy

mov ax,[edi]
dec ax
mov bl,10
div bl
mov dh,9
sub dh,al
test al,1
jnz _ulta2
mov dl,ah
jmp _move2

_ulta2:
mov dl,10
sub dl,ah
dec dl
_move2:
add dl,dl
add dl,dl
inc dl
call gotoxy
mov al,00010000b
call settextcolor
mov edx,offset gaps
call writestring

;PLAYER3
mov edx,0
add edi,4
call gotoxy

mov ax,[edi]
dec ax
mov bl,10
div bl
mov dh,9
sub dh,al
test al,1
jnz _ulta3
mov dl,ah
jmp _move3

_ulta3:
mov dl,10
sub dl,ah
dec dl
_move3:
add dl,dl
add dl,dl
inc dl
call gotoxy
mov al,00100000b
call settextcolor
mov edx,offset gaps
call writestring

;PLAYER4
mov edx,0
add edi,4
call gotoxy

mov ax,[edi]
dec ax
mov bl,10
div bl
mov dh,9
sub dh,al
test al,1
jnz _ulta4
mov dl,ah
jmp _move4

_ulta4:
mov dl,10
sub dl,ah
dec dl
_move4:
add dl,dl
add dl,dl
inc dl
call gotoxy
mov al,11100000b
call settextcolor
mov edx,offset gaps
call writestring



mov al,00001111b
call settextcolor
mov dh,15
mov dl,0
call gotoxy

ret
UpdatePos ENDP

PrintBorder PROC
mov edx,0
call gotoxy
mov al,00001111b
call settextcolor
mov ecx,10
mov eax,1
L2:
mov ebx,ecx
mov ecx,11
L1:
mov eax,0
mov al,_div
call writechar
mov edx, offset gaps
call writestring
LOOP L1
call crlf
mov ecx,ebx
LOOP L2
mov ecx,20
ret
PrintBorder ENDP


PrintNums PROC
mov edx,0
mov dl,1
call gotoxy
mov eax,100
mov _temp,eax
mov ecx,10

L3:
mov ebx,ecx
mov ecx,10

L4:
mov eax,_temp
call writedec
dec eax
mov _temp,eax
test bl,1
jnz _odd
add dl,4
jmp _cont
_odd:
sub dl,4
_cont:
call gotoxy
LOOP L4

inc dh
test bl,1
jnz odd_
sub dl,4
jmp cont_
odd_:
mov dl,1
cont_:
call gotoxy
mov ecx,ebx
LOOP L3
ret

PrintNums ENDP

PrintLadders PROC
mov edx,0
mov dh,9
call gotoxy
;one block is 3 spaces and a divider
mov dl,1
call gotoxy

mov eax,0
mov al,00000010b
mov edx,offset _l1
call settextcolor
call writestring
mov al,00001111b
call settextcolor
mov edx,0
mov dh,6
add dl,9
call gotoxy
mov eax,0
mov al,00000010b
mov edx,offset _l1
call settextcolor
call writestring
mov al,00001111b
call settextcolor


;LADDER 2
mov edx,0
mov dh,9
mov dl,13
call gotoxy

mov eax,0
mov al,00000010b
mov edx,offset _l2
call settextcolor
call writestring
mov edx,0
mov dh,8
add dl,25
call gotoxy
mov eax,0
mov al,00000010b
mov edx,offset _l2
call settextcolor
call writestring
mov al,00001111b
call settextcolor

;LADDER 3

mov edx,0
mov dh,9
mov dl,29
call gotoxy

mov eax,0
mov al,00000010b
mov edx,offset _l3
call settextcolor
call writestring
mov edx,0
mov dh,7
add dl,37
call gotoxy
mov eax,0
mov al,00000010b
mov edx,offset _l3
call settextcolor
call writestring
mov al,00001111b
call settextcolor


;LADDER 4

mov edx,0
mov dh,7
mov dl,1
call gotoxy

mov eax,0
mov al,00000010b
mov edx,offset _l4
call settextcolor
call writestring
mov edx,0
mov dh,5
add dl,5
call gotoxy
mov eax,0
mov al,00000010b
mov edx,offset _l4
call settextcolor
call writestring
mov al,00001111b
call settextcolor

;LADDER 5

mov edx,0
mov dh,7
mov dl,29
call gotoxy

mov eax,0
mov al,00000010b
mov edx,offset _l5
call settextcolor
call writestring
mov edx,0
mov dh,2
add dl,17
call gotoxy
mov eax,0
mov al,00000010b
mov edx,offset _l5
call settextcolor
call writestring
mov al,00001111b
call settextcolor


;LADDER 6

mov edx,0
mov dh,5
mov dl,37
call gotoxy

mov eax,0
mov al,00000010b
mov edx,offset _l6
call settextcolor
call writestring
mov edx,0
mov dh,3
add dl,25
call gotoxy
mov eax,0
mov al,00000010b
mov edx,offset _l6
call settextcolor
call writestring
mov al,00001111b
call settextcolor

;LADDER 7

mov edx,0
mov dh,2
mov dl,1
call gotoxy

mov eax,0
mov al,00000010b
mov edx,offset _l7
call settextcolor
call writestring
mov edx,0
mov dh,0
add dl,5
call gotoxy
mov eax,0
mov al,00000010b
mov edx,offset _l7
call settextcolor
call writestring
mov al,00001111b
call settextcolor

;LADDER 8

mov edx,0
mov dh,2
mov dl,37
call gotoxy

mov eax,0
mov al,00000010b
mov edx,offset _l8
call settextcolor
call writestring
mov edx,0
mov dh,0
add dl,33
call gotoxy
mov eax,0
mov al,00000010b
mov edx,offset _l8
call settextcolor
call writestring
mov al,00001111b
call settextcolor
ret

printLadders ENDP


PrintSnakes PROC
;SNAKE 1

mov edx,0
mov dh,9
mov dl,21
call gotoxy

mov eax,0
mov al,00000100b
mov edx,offset _s1
call settextcolor
call writestring
mov edx,0
mov dh,6
add dl,17
call gotoxy
mov eax,0
mov al,000000100b
mov edx,offset _s1
call settextcolor
call writestring
mov al,00001111b
call settextcolor


;SNAKE 2

mov edx,0
mov dh,9
mov dl,37
call gotoxy

mov eax,0
mov al,00000100b
mov edx,offset _s2
call settextcolor
call writestring
mov edx,0
mov dh,6
add dl,33
call gotoxy
mov eax,0
mov al,000000100b
mov edx,offset _s2
call settextcolor
call writestring
mov al,00001111b
call settextcolor


;SNAKE 3

mov edx,0
mov dh,8
mov dl,9
call gotoxy

mov eax,0
mov al,00000100b
mov edx,offset _s3
call settextcolor
call writestring
mov edx,0
mov dh,3
add dl,5
call gotoxy
mov eax,0
mov al,000000100b
mov edx,offset _s3
call settextcolor
call writestring
mov al,00001111b
call settextcolor


;SNAKE 4

mov edx,0
mov dh,7
mov dl,13
call gotoxy

mov eax,0
mov al,00000100b
mov edx,offset _s4
call settextcolor
call writestring
mov edx,0
mov dh,1
add dl,29
call gotoxy
mov eax,0
mov al,000000100b
mov edx,offset _s4
call settextcolor
call writestring
mov al,00001111b
call settextcolor


;SNAKE 5

mov edx,0
mov dh,7
mov dl,21
call gotoxy

mov eax,0
mov al,00000100b
mov edx,offset _s5
call settextcolor
call writestring
mov edx,0
mov dh,5
add dl,29
call gotoxy
mov eax,0
mov al,000000100b
mov edx,offset _s5
call settextcolor
call writestring
mov al,00001111b
call settextcolor

;SNAKE 6

mov edx,0
mov dh,4
mov dl,17
call gotoxy

mov eax,0
mov al,00000100b
mov edx,offset _s6
call settextcolor
call writestring
mov edx,0
mov dh,0
add dl,21
call gotoxy
mov eax,0
mov al,000000100b
mov edx,offset _s6
call settextcolor
call writestring
mov al,00001111b
call settextcolor

;SNAKE 7

mov edx,0
mov dh,2
mov dl,9
call gotoxy

mov eax,0
mov al,00000100b
mov edx,offset _s7
call settextcolor
call writestring
mov edx,0
mov dh,0
add dl,13
call gotoxy
mov eax,0
mov al,000000100b
mov edx,offset _s7
call settextcolor
call writestring
mov al,00001111b
call settextcolor
mov edx,0
mov dh,12
add dl,0
call gotoxy
ret

PrintSnakes ENDP


END main