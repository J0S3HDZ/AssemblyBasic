include 'emu8086.inc'
org 100h                  
;Ingrese el costo del boleto
;Ingrese la edad de la persona
;Si la persona es JGE a 60 a�os
;Descontar 100 pesos del boleto
;El costo total del boleto es

.data
resta db 3 dup (?)
;msg db 'Bienvenido a el programa de boletos$'    
    msg2 db 13,10, 'El costo del boleto es: '
.code
restas proc
    print " "
    print "Valor de boleto: "
    call scan_num
    mov resta[0],cl
    printn " "
    print "Descuento: "
    call scan_num    
    sub resta[1],cl
    printn " "
    print "Edad: "
    call scan_num
    mov resta[2]      
    
    mov bx, 3Ch
    cmp bx, resta[2]
    
    jge descuento
    
    xor ax,ax
    add al,resta[0]
    add al, resta[1]
    printn " "
    print "La resta es: "
    call print_num
    
restas endp
            
        
    
        exit:
        printn ""
        print "Presione enter para salir..."
        mov ah, 0
        int 16h
        ret
                  
define_print_string
define_print_num
define_print_num_uns
define_scan_num

           
        
