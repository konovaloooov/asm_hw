.model small                 ;������ ����� SMALL �ᯮ���� ᥣ����� 
                             ;ࠧ��஬ �� ����� 64��
.stack 100h                  ;������� �⥪� ࠧ��஬ 100h (256 ����)
.data                        ;��砫� ᥣ���� ������
Hello db '��������� ����ᠭ�� 211$'
.code                        ;��砫� ᥣ���� ����
start:                       ;��窠 �室� � �ணࠬ�� start 
                             ;�।��।������� ��⪠ @data ������砥�
                             ;���� ᥣ���� ������ � ������ ����᪠ �ணࠬ��,
mov AX, @data                ;����� ᭠砫� ����㧨� � AX,
mov DS,AX                    ;� ��⥬ ��७�ᥬ �� AX � DS
mov AH,09h
mov DX,offset Hello
int 21h
mov AX,4C00h
int 21h
end start