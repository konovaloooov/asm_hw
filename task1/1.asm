stak segment stack 'stack'      ;��砫� ᥣ���� �⥪�
db 256 dup (?)                  ;����ࢨ�㥬 256 ���� ��� �⥪�
stak ends                       ;����� ᥣ���� �⥪�
data segment 'data'             ;��砫� ᥣ���� ������
Hello db '��������� ����ᠭ�� 211$'       ;��ப� ��� �뢮��
data ends                       ;����� ᥣ���� ������
code segment 'code'             ;��砫� ᥣ���� ����
assume CS:code,DS:data,SS:stak  ;�������� ॣ���� CS �㤥� 㪠�뢠�� �� ᥣ���� ������,
                                ;ॣ���� DS - �� ᥣ���� ������, SS ? �� �⥪
start:                          ;��窠 �室� � �ணࠬ�� start
;��易⥫쭠� ���樠������ ॣ���� DS � ��砫� �ணࠬ��
mov AX,data                     ;���� ᥣ���� ������ ᭠砫� ����㧨� � AX,
mov DS,AX                       ;� ��⥬ ��७�ᥬ �� AX � DS
mov AH,09h                      ;�㭪�� DOS 9h �뢮�� �� �࠭
mov DX,offset Hello             ;���� ��砫� ��ப� '��������� ����ᠭ�� 211' �����뢠���� � ॣ���� DX
int 21h                         ;�맮� �㭪樨 DOS
mov AX,4C00h                    ;�㭪�� 4Ch �����襭�� �ணࠬ�� � ����� ������ 0
int 21h                         ;�맮� �㭪樨 DOS
code ends                       ;����� ᥣ���� ����
end start                       ;����� ⥪�� �ணࠬ�� � �窮� �室�