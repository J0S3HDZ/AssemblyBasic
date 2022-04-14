include 'emu8086.inc'
.model small
org 100h
.stack 64
.data 
    msj1 db 13,10,'Capturando articulos...',13,10,'Cantidad: ','$'
    msj2 db 13,10,'Precio: ','$'
    msj3 db 13,10,'Desea capturar otro articulo? 1.SI 2.NO',13,10,'$'
    msj4 db 13,10,'Has comprado ','$'
    msj5 db ' articulos','$'
    msj6 db 13,10,'Subtotal: ','$'
    unidades db 0
    decenas db 0
    cantidad db 0 
    precio db 0    
    total db 0           
    cantFin db 0        
    preFin db 0
    opcion DW ?
    
.code   
main proc
        
    ciclo:
    xor ax,ax
    mov ax,@data
    mov ds,ax
    ;Leer el mensaje1
    lea dx,msj1
    mov ah,9h
    int 21h 
    xor ax,ax
    ;Leer la variable de cantidad
    mov ah,01h
    int 21h
    sub al,30h
    mov cantidad,al
    xor ax,ax
    ;Leer el mensaje2
    lea dx,msj2
    mov ah,9h
    int 21h 
    xor ax,ax
    ;Leer la variable precio    
    mov ah,01h
    int 21h
    sub al,30h 
    mov precio,al
    xor ax,ax
    call operacion
    ;Leer el mensaje 3
    lea dx,msj3
    mov ah,9h
    int 21h
    xor ax,ax
    ;si/no   
    call scan_num
    mov opcion,CX
    mov AX,opcion
    mov BX,1h
    cmp AX,BX       
    je ciclo 
    call fin
     
     
    operacion:
    ;Hacer la multiplicacion de cantidad * precio
    xor ax,ax   
    mov al,cantidad
    mul precio
    add al,total
    mov total,al
    ;Suma de la cantidad de productos
    xor ax,ax
    add al,cantidad
    add al,cantFin
    mov cantFin,al
    ret
    
    
    fin: 
    mov al,total
    printn " "
    print "Subtotal: "
    call print_num 
    
    mov al,cantFin
    printn " "
    print "Articulos comprados: "
    call print_num
            
         main endp

define_print_string
define_print_num
define_print_num_uns
define_scan_num

end
