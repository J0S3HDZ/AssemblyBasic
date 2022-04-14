name "Decimal a Binario"
org 100h 
include 'emu8086.inc'
jmp start

msg1 db 13,10, " Ingrese numero de -32768 a 65535, o presione 0 para salir: ",'$'  
msg2 db 13,10, " forma binaria: ",'$'

buffer db 7,?,5 dup (0),0,0

binary dw ?

start:
    mov dx, offset msg1
    ;print "Ingrese numero: "
    mov ah, 9
    int 21h
    
    mov dx, offset buffer
    mov ah,0ah
    int 21h
    
    
    mov bx,0
    mov bl, buffer[1]
    mov buffer[bx+2],0
    
    lea si,buffer+2
    call tobin
                
    mov binary,cx
    
    jcxz stop
    
    mov dx,offset msg2
    mov ah,9
    int 21h
    
    mov bx,binary
    mov cx,16
    
print:
    mov ah,2
    mov dl,'0'  
    test bx,1000000000000000b
    jz zero
    mov dl,'1'
zero:
    int 21h
    shl bx,1
loop print

mov dl,'b'
int 21h

jmp start

stop:    
    ret
    
tobin proc near
    push dx
    push ax
    push si
    
jmp process

make_minus db ?
ten dw 10

process:
    mov cx,0
    mov cs:make_minus,0
    
next_digit:
    mov al,[si]
    inc si
    
        cmp al,0
        jne not_end
        jmp stop_input
        
not_end:
    cmp al,'-'
    jne ok_digit
    mov cs:make_minus,1
    jmp next_digit
    
ok_digit:
    push ax
    mov ax,cx
    mul cs:ten
    mov cx,ax
    pop ax
    
    sub al,30h
    
    mov ah,0   
    mov dx,cx
    add cx,ax
    
    jmp next_digit
    
stop_input: 
    cmp cs:make_minus,0
    je not_minus
    neg cx
    
not_minus:
    pop si
    pop ax
    pop dx
    ret
tobin endp
