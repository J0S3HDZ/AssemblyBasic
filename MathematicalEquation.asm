include 'emu8086.inc'
 org 100h
 .data
    A db ?
    B db ?
    pot db ?
    byteh db ?
    bytel db ?
    C db ? 
    D db ?
    E db ?
    R1 db ?
    R2 db ?
    R3 db ?
    ResulF db 0  
    contador db 1
 msj1 db 13,10,'Operacion (A^B)+(C!)+(D*E)','$'
 msj2 db 13,10,'Ingrese A:','$'
 msj3 db 13,10,'Ingrese B:','$' 
 msj4 db 13,10, 'Ingrese C: $' 
 msj5 db 13,10, 'Ingrese D: $'
 msj6 db 13,10, 'Ingrese E: $'
 msj7 db 13,10, 'Resultado: $' 
 mensaje31 db 13,10, '$'
 .code
 main proc 
     
    ;leer mensaje 1 
    lea dx,msj1
    mov ah,9h
    int 21h 
    
    ;leer mensaje 2 y variable A
    lea dx,msj2
    mov ah,9h
    int 21h
    call scan_num
    mov A,cl 
     
    ;leer mensaje 3 y variable B 
    lea dx,msj3
    mov ah,9h
    int 21h
    call scan_num
    mov B,cl 
    
    call potencia
    
    
    ;Leer el mensaje4 y variable de C
    lea dx,msj4
    mov ah,9h
    int 21h 
    call scan_num
    mov C,cl 
    mov bl,1 
    mov al,1
    call factorial
    
    
    
    
    
    potencia:
    mov al,1h
    mov bl,A
    mov cl,B
    ciclo:
    mul bl
    loop ciclo
    mov R1,al   
    ret
    
    factorial:
    mul bl
    inc bl
    cmp bl,C   
    ja resulFact
    call factorial
    
    resulFact:
    mov R2,al
    call DYE
    
    
    DyE:
    ;Leer el mensaje5
    lea dx,msj5
    mov ah,9h
    int 21h 
    call scan_num
    mov D,cl    
    
    ;Leer el mensaje6
    
    lea dx,msj6
    mov ah,9h
    int 21h 
    call scan_num
    mov E,cl 
    call multi  
    call imprime
    
    multi:
    xor ax,ax   
    mov al,D
    mul E
    add al,R3
    mov R3,al
    ret
    
    suma:
    xor ax,ax
    add al,R1
    add al,R2
    add al,R3
    mov ResulF,al
    ret
    
    imprime:
    mov al,R1
    printn " "
    print "Potencia: "
    call print_num  
    
    xor ax,ax 
    mov al,R2
    printn " "
    print "Factorial:  "
    call print_num 
    
    mov al,R3
    printn " "
    print "Multiplicacion:  "
    call print_num 
    call suma
    
    
    mov al,ResulF
    printn " "
    print "Resultado: "
    call print_num
    
    call finalizar
    
     
    finalizar:
    mov ah,4ch
    int 21h
    
main endp

define_print_string
define_print_num
define_print_num_uns
define_scan_num

end



