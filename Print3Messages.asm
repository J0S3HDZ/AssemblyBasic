
.model small
.stack
.data
    mensaje db 13,10, 'Hola Mundo $'
    mensaje2 db 13,10, 'Desarrollo de Software $'
    mensaje3 db 13,10, 'Bienvenidos $'
    
.code
    inicio:
        mov ax, @data
        mov ds, ax
        
        mov dx, offset mensaje
        call imprimir
        
        mov dx, offset mensaje2
        call imprimir
        
        mov dx, offset mensaje3
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
    
    
    
    ;4ch Termina programa
    ;21h Salida del resultado
    ;call = jmp   
    ;jmp se utiliza mas antes de finalizar un programa
    
