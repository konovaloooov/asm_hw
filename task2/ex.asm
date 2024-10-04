.model tiny               
.code                     
org 100h  
start:
	mov dx,offset Mess1
	call Out_string
	mov dx,offset Mess2
	call Out_string
	mov AX,4C00h
	int 21h
	Out_string proc
		mov ah,09h
		int 21h
		ret
	Out_string endp
	
Mess1 db 'String1 ',0Dh,0Ah,'$'   ; строка с символами перехода на новую строку
Mess2 db 'String2 $'
end start