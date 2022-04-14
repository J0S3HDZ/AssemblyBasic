.model small    ; se define el modelo de memoria
.stack 64       ; se define el tamano de la pila

.data ;define variables

nombre db "CALCULAR LA POTENCIA DE UN NUMERO", 13, 10, 13, 10, '$' ; Titulo del programa que aparece en pantalla del DOC
mensaje1 db "POR FAVOR INGRESE LA BASE: ",13,10,'$' ; Mensaje de ingreso de la potenciacion
mensaje2 db "POR FAVOR INGRESE EL EXPONENTE: ",13,10,'$' ; Mensaje al usuario para ingreso del exponente
mensaje3 db "EL RESULTADO ES: ", '$' ; Mensaje al imprimir el resultado de la operacion
pot db 1 ; Variable de tipo db
base db 0 ; Variable para guardar base
exp db 0 ; Variable para guardar exponente
byteh db 0
bytel db 0
salto db " ", 13,10,'$' ; Salto una fila

.code

inicio proc far
mov ax, @data ; Direccionamiento segmento de datos
    mov ds,ax ; Se guarda lo que esta en ax en el segmento datos

; limpia la pantalla
mov ah, 00
mov al, 03h
int 10h

; Inicializar registros
mov ah, 02h
mov bh, 00
mov dh, 00
mov dl, 00
int 10h

; Para mostrar el titulo
mov ah, 09h
lea dx, nombre
int 21h

        mov ah, 09h ; Para impresion de caracteres
        lea dx, salto ; para salto de filas
        int 21h
   
        mov ah, 09h
        lea dx, mensaje1 ; Solicitud de numero para la base
        int 21h
   
        mov ah, 01h ; Leer y mostrar el numero digitado
        int 21h
   
        sub al, 30h ; Para hacer la conversion ASCII
        mov base, al ; Se pasa a la variable base
        int 21h
   
        mov ah, 09h ; Para impresion de caracteres
        lea dx, salto ; Para salto de una fila
        int 21h
       
        ; Para solicitar exponente  
        mov ah, 09h
        lea dx, mensaje2
        int 21h
   
        ; Leer y mostrar el valor digitado
        mov ah, 01h
        int 21h
   
        sub al, 30h ; Para hacer la conversion ASCII
        mov exp, al ; Se pasa el exponente a la variable exp
        int 21h
   
        mov cl, exp ;Se cambia el registro cx con el numero de iteraciones
   
        product:
        mov al, base ; Se mueve el valor de la base al registro al
        mov bl, pot ; Se mueve a bl el valor de variable pot  
        mul bl ; Se multiplica a bl
        mov pot, al ; Se pone el resultado en la variable pot 
        mov ah,1h
        cmp cl,ah
        je romper
        loop product ; Se retorna a la etiqueta product si cx no es cero
                 
        romper:
                 
        mov ah, 09h ; Para impresion de caracteres
        lea dx, mensaje3; Para salto de una fila
        
        int 21h
   
        mov al, pot
        aam
        mov bytel, al
        mov byteh, ah
   
        mov ah, 02h
   
        mov dl, byteh
        add dl, 30h
        int 21h
   
        mov dl, bytel
        add dl, 30h
        int 21h
        jmp salir
   
        salir: ; Retorna el mando al DOS
    mov ax, 4C00H
    int 21h
inicio endp
end inicio
