org 100h
include 'emu8086.inc'

printn "INGRESE EL NUMERO: "
call scan_num
mov bp,cx ;Este es el numero a comparar
printn ""

push bp[300]
mov ax,1
mov cx,1
cmp bp,2
jng primo         ; si bp es mayor a 2 el numero es primo
jg comparacion     ; si no es mayor sigue el procedimiento


comparacion:
  mov ax,cx
  mul ax
  cmp ax,bp
  jg decremento  ;en caso de k sea mayor
  je no_primo    ;no es primo 
  jl incremento  ;menor
    
 decremento:
 dec cx
 jmp  modulo


 incremento:
 inc cx
 jmp comparacion
                   

modulo:
                   
  pop bp[300]    ; retorna valor a bp
  mov ax,cx ;recupero valor de cx para ponerlo en ax
  mov bx,bp ;salvo valor guardado de numero
  xchg bp,ax ;intercambio valores para hacer division
 
    ciclo:
      cmp cx,2
      jnl entra ;si es mayor
      jl  primo ;si es menor
     
        
         entra:
           div cx
           cmp dx,0 ;nos da el modulo de la operacion
           je no_primo ;tiene paridad
           jg seguir  ;sigo para continuar con el decremento
          
        
         seguir:
           dec cx
           mov ax,bx
           mov dx,0
           jmp ciclo 
        
        

no_primo:
printn "NO ES PRIMO"
         
           
jmp final

primo:
printn "ES PRIMO"
jmp final

final: 
printn "FIN DEL PROGRAMA..." 
mov ah,4ch
int 21h
ret                     

ends

define_print_string
define_print_num
define_print_num_uns
define_scan_num
