.model small
.stack 64
.data
include 'emu8086.inc'
msj1 db 13,10, '- Factorial -', '$'
msj2 db 13,10, 'Ingrese n1: ', '$'
msj3 db 13,10, 'Ingrese n2: ', '$'
msj4 db 13,10, 'Ingrese n3: ', '$'
Mayor db 13,10, 'El mayor es: ', '$'

n1 db 100 dup('$')
n2 db 100 dup('$')
n3 db 100 dup('$')

salto db 13,10,13,10,'$'
.code
    inicio:
        mov si,0
        mov ax,@data
        mov ds,ax
                
        mov ah,09
        mov dx,offset msj1
        int 21h
        
        call saltodelinea
       
        mov ah,09
        mov dx,offset msj2
        int 21h   
        
        call leer
        mov n1,al
        call saltodelinea
        
        mov ah,09
        mov dx,offset msj3
        int 21h
        
        call leer
        mov n2,al
        call saltodelinea
        
        mov ah,09
        mov dx,offset msj4
        int 21h

        call leer
        mov n3,al
        call saltodelinea



        mov ah,n1
        mov al,n2
        cmp ah,al
        jge compara-1-3
        jmp compara-2-3

    compara-1-3:
        mov al,n3 
        cmp ah,al 
        jge mayor1 

    compara-2-3:
        mov ah,n2
        mov al,n3
        cmp ah,al 
        jge mayor2 
        jmp mayor3

 
    mayor1:
        call msgMayor 
        mov dx, offset n1 
        mov ah, 9
        int 21h
        jmp fin

    mayor2:
        call msgMayor

        mov dx, offset n2 
        mov ah, 9
        int 21h
        jmp fin

    mayor3:
        call msgMayor

        mov dx, offset n3 
        mov ah, 9
        int 21h
        jmp fin


    msgMayor:
        mov dx, offset Mayor
        mov ah, 9
        int 21h
        ret    

    leer:
        mov ah,01h
        int 21h
        ret

    saltodelinea:
        mov dx, offset salto
        mov ah, 9
        int 21h
        ret

    fin:
        mov ax, 4c00h
        int 21h 
    ends
