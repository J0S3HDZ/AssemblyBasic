          
.model small
.stack 64
.data
    ms1 db 13,10,"Introduce N1: ",'$'
    ms2 db 13,10,"Introduce N2: ",'$'
    ms3 db 13,10,"Introduce N3: " ,'$'
    res db 13,10,"El numero mayor es: ",'$'
    n1 db 100 dup('$')
    n2 db 100 dup('$')
    n3 db 100 dup('$')      

    
.code
    mov ax, @data
    mov dx,ax
    
    mov ah,09h           
    lea dx, ms1
    int 21h
    call leer
    mov n1,al

    mov ah,09h
    lea dx, ms2
    call leer
    mov n2,al 
    
    mov ah,09h
    lea dx, ms3 
    int 21h
    call leer
    mov n3,al
    
    
    ;comparo
    mov ah,n1
    mov al,n2
    cmp ah,al
    jge mayor13
    jmp mayor23
    
mayor13:
    mov al,n3
    cmp ah,al
    jge mayor1

mayor23:
    mov ah,n2
    mov al, n3
    cmp ah,al
    jge mayor2
    jmp mayor3  
    
    
mayor1:

    call msgMayor
    
    mov dx, offset n1
    mov ah,9
    int 21h
    jmp fin         
    
mayor2:
    call msgMayor
    
    mov dx, offset n2
    mov ah,9
    int 21h
    jmp fin     
    
mayor3:
     call msgMayor
    
    
    mov ah,9
    int 21h
    jmp fin     
    

leer:
    mov ah,01h
    
    ret
    
msgMayor:
     mov ah,09h
    lea dx, res
    int 21h
    ret   
                int 21h

    
fin:
    mov ax,4c00h
    int 21h
    ends
     

end
