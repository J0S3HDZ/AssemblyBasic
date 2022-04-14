
; CMP comparar 2 numeros
; A mayor B - Instruccion JG
; A menor B - Instruccion JL
; A = B - Instruccion JE    
; A mayorigual B - JGE

.model small
.stack
.data    
    mensaje  db 13,10, 'Ax es mayor a Bx $'
    mensaje2 db 13,10, 'Ax es menor a Bx $'
    mensaje3 db 13,10, 'Ax es igual a Bx $'
    mensaje4 db 13,10, 'Descuento INAPAM 50% $'
    mensaje5 db 13,10, 'Paga completo $'
    
.code
    inicio:
        mov ax, @data
        mov ds, ax
        
        mov ax, 3Ch ;69 decimal
        mov bx, 3Ch ;60 decimal
        
        cmp ax,bx
        ;jg esMayor
        ;jl esMenor
        jg descuento   
        
        ;jge descuento
        
        lea dx, mensaje5
        call imprimir
        jmp finalizar 
        
        
    descuento:
        lea dx, mensaje4
        call imprimir
        jmp finalizar   
        ret
        
    esMayor:
        lea dx, mensaje
        call imprimir
        jmp finalizar
        
    esMenor:
        lea dx, mensaje2
        call imprimir
        jmp finalizar
        
    esIgual:
        lea dx, mensaje3
        call imprimir
        jmp finalizar
                    
    imprimir:
        mov ah, 9h
        int 21h  
        ret
    
    finalizar:
        mov ah, 4ch
        int 21h
        
    end inicio
    
