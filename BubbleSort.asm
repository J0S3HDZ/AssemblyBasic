
include 'emu8086.inc'   
.data
  

DATOS SEGMENT
    ; DECLARAR LAS VARIABLES AQU?
    ;16,15,14,255
    ;14 15 16 255  d
    ARRAY_BURBUJA db 4,7,2,9,1
   ;ARRAY_BURBUJA DB a,b,c,d,e 
  
    
    ;--------------------------------------------------------------------------
DATOS ENDS

PILA SEGMENT
    DB 64 DUP(0)
PILA ENDS

CODIGO SEGMENT

    INICIO PROC FAR ;NEAR Y FAR

    ASSUME DS:DATOS, CS:CODIGO, SS:PILA 
   ; ASSUME CS:CODIGO, SS:PILA 
     
    PUSH DS
    MOV AX, 0
    PUSH AX
    
    MOV AX, DATOS
    MOV DS, AX
    MOV ES, AX
                                                                                                                                                        
    ; CODIGO DE NUESTRO PROGRAMA AQUI---------------------------------------------
    MOV CX, 4
    MOV SI, 0
    MOV DI, 0
    
    CICLO1:
    PUSH CX ;PONER EN LA PILA EL VALOR DE CX
    ;LEA SI, OFFSET ARRAY_BURBUJA 
    LEA SI, ARRAY_BURBUJA ;PASAR LA DIRECCION EFECTIVA DEL ARREGLO A SI
    MOV DI, SI  ;Y LUEGO PASARLA A DI  
    
    CICLO2:
    INC DI    ;INCREMENTAR DI PARA PODER COMPARAR LA SIGUIENTE POSICION
    MOV AL, [SI] ;PASAR EL VALOR QUE SE ENCUENTRA EN LA DIRECCION DE SI A AL
    CMP AL, [DI] ; COMPARAR CON EL VALOR QUE SE ENCUENTRA EN LA POSICION DE DI
    JA INTERCAMBIO ; SALTA A LA ETIQUETA SI ES MAYOR
    JB MENOR ; SALTA A LA ETIQUETA SI ES MENOR
    
    INTERCAMBIO: 
    MOV AH, [DI] ; MUEVE EL VALOR QUE SE ENCUENTRA EN DI A AH
    MOV [DI], AL ; MUEVE EL VALOR DE AL A LA POSICION DE DI
    MOV [SI], AH ; PASA EL VALOR DE AH A LA POSICION DE SI  
    
    MENOR:   
    INC SI
    LOOP CICLO2
    POP CX
    LOOP CICLO1      
    
    IMPRIMIR:  
    PRINTN ""
    PRINT "ARRAY ORDENADO: "
    PRINTN ""

        
    SUB SI,SI
    LEA BX,ARRAY_BURBUJA
    
    LOOP3:
    MOV DX,[BX+SI]
    print " "
 
    ADD DX,30H
    MOV AH,2H
    INT 21H
    
    INC SI
    CMP SI,5
    JNE LOOP3
    
    EXIT:
    RET
    INICIO ENDP
    
 
   CODIGO ENDS 
    
define_print_string
define_print_num
define_print_num_uns
define_scan_num

END INICIO
