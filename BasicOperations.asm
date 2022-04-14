.model small

.stack 64

.data

;Variables globales
numero1 db 0
numero2 db 0

d db 0
u db 0

suma db 0
resta db 0
multiplicar db 10
division db 0
modulo db 0

msjn1 db 10,13,"Ingrese el primer numero: ",'$'   ;N1
msjn2 db 10,13,"Ingrese el segundo numero: ",'$'   ;N2


;Mostrar resultados

msjnS db 10,13,"La suma es: ",'$'
msjnR db 10,13,"La resta: ",'$'
msjnM db 10,13,"La multiplicacion es: ",'$'
msjnD db 10,13,"La division es: ",'$'
msjnMod db 10,13,"El modulo es: ",'$'
                                                        
.code
begin proc far
    ;Direccionamiento del procedimiento
    mov ax, @data
    mov ds,ax
    
    ;Solicitar del teclado numero 1
    mov ah ,09
    lea dx,msjn1
    int 21h
    mov ah, 01
    int 21h
    sub al, 30h
    mov numero1,al
    
    ;Solicitar del teclado numero 2                                                    
    mov ah, 09
    lea dx,msjn2
    int 21h
    mov ah,01
    int 21h
    sub al,30h
    mov numero2,al
    
    ;SUMA
    mov al,numero1
    add al,numero2
    mov suma,al
    
    ;RESTA
    mov al, numero1
    sub al,numero2
    mov resta,al
    
    ;MULTIPLICACION
    mov al,numero1
    mul numero2
    mov multiplicar,al
    
    ;DIVISION
    mov al, numero1
    div numero2
    mov division,al
    
    ;MODULO
    mov al, numero1
    div numero2
    mov modulo,ah      
                     
    ;Mostrar los mensajes del resultado
    
    ;Mostrando la suma
    mov ah, 09
    lea dx, msjnS
    int 21h
    mov dl, suma
    add dl,30h
    mov ah,02
    int 21h
    
    ;mostrando la multiplicacion
    mov ah, 09
    lea dx, msjnM
    int 21h
    mov dl, multiplicar
    add dl,30h
    mov ah, 02
    int 21h
    
    ;mostrando la divison
    mov ah, 09
    lea dx, msjnD
    int 21h
    mov dl, division
    add dl,30h
    mov ah, 02
    int 21h
    
    ;mostrando la modulo
    mov ah, 09
    lea dx, msjnMod
    int 21h
    mov dl, modulo
    add dl,30h
    mov ah, 02
    int 21h         
    
    mov ah, 4ch
    int 21h
