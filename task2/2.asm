.model small ;������ ����� SMALL �ᯮ���� ᥣ����� ࠧ��஬ �� ����� 64��
.stack 100h ;������� �⥪� ࠧ��஬ 100h (256 ����)
.data ;��砫� ᥣ���� ������
student db '��������� ����ᠭ�� 211$'
newline db 0Dh, 0Ah, '$'
.code ;��砫� ᥣ���� ����
start: ;��窠 �室� � �ணࠬ�� start

;�।��।������� ��⪠ @data ������砥�
;���� ᥣ���� ������ � ������ ����᪠ �ணࠬ��,
mov AX, @data ;����� ᭠砫� ����㧨� � AX,
mov DS, AX ;� ��⥬ ��७�ᥬ �� AX � DS

call print_student
call new_line

;�� �᫮��� ��� ������ ��� ���� � ॣ����� ax, bx ᮮ⢥��⢥���
mov AX, 7 ;1 ���
mov BX, 3 ;2 ���

add AX, 30h ;�८�ࠧ㥬 ���� �� ASCII ⠡���(�ਬ��: �� ⠡��� 1 ��� ����� 31, �ਡ���塞 30h)
push AX;��࠭��� ���祭��, �.�. ����� ��� ᨬ���� �������� � ������� ���� ॣ���� AX
mov DL,AL ;DL ? �뢮���� ᨬ���
call print_num ;��뢠�� ��楤���

call space

add BX, 30h ;�८�ࠧ㥬 ���� �� ASCII ⠡���(�ਬ��: �� ⠡��� 1 ��� ����� 31, �ਡ���塞 30h)
mov DL,BL ;DL ? �뢮���� ᨬ���
call print_num ;��뢠��

call new_line

pop AX
XCHG AX, BX

mov DL,AL ;DL ? �뢮���� ᨬ���
call print_num ;��뢠�� ��楤���
call space
mov DL,BL ;DL ? �뢮���� ᨬ���
call print_num ;��뢠��

mov AX,4C00h
int 21h

print_num proc
	mov AH,02h
	int 21h
	ret
print_num endp

print_student proc
    mov AH,09h
    mov DX,offset student
    int 21h
    ret
print_student endp

new_line proc
    mov DX, offset newline
	mov AH,09h
	int 21h
	ret
new_line endp

space proc
	mov DL,20h
    mov ah,02h ;
    int 21h ;
    ret
space endp

end start
