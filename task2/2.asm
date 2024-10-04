.model small ;Модель памяти SMALL использует сегменты размером не более 64Кб
.stack 100h ;Сегмент стека размером 100h (256 байт)
.data ;Начало сегмента данных
student db 'Коновалов Александр 211$'
newline db 0Dh, 0Ah, '$'
.code ;Начало сегмента кода
start: ;Точка входа в программу start

;Предопределенная метка @data обозначает
;адрес сегмента данных в момент запуска программы,
mov AX, @data ;который сначала загрузим в AX,
mov DS, AX ;а затем перенесем из AX в DS

call print_student
call new_line

;по условию нам заданы две цифры в регистрах ax, bx соответственно
mov AX, 7 ;1 цифра
mov BX, 3 ;2 цифра

add AX, 30h ;Преобразуем цифру по ASCII таблице(пример: по таблице 1 под кодом 31, прибавляем 30h)
push AX;сохранили значение, т.к. далее код символа попадает в младшую часть регистра AX
mov DL,AL ;DL ? выводимый символ
call print_num ;вызываем процедуру

call space

add BX, 30h ;Преобразуем цифру по ASCII таблице(пример: по таблице 1 под кодом 31, прибавляем 30h)
mov DL,BL ;DL ? выводимый символ
call print_num ;вызываем

call new_line

pop AX
XCHG AX, BX

mov DL,AL ;DL ? выводимый символ
call print_num ;вызываем процедуру
call space
mov DL,BL ;DL ? выводимый символ
call print_num ;вызываем

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
