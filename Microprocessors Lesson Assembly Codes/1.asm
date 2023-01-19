
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h
    
    mov bx,0200h
    
    mov byte ptr[bx],55h
    
    mov byte ptr [bx+1],66h
    
    mov byte ptr [bx+2],54h
    
    mov byte ptr [bx+3],11h
    
    mov byte ptr [bx+4],87h
    
    mov byte ptr [bx+5],33h
    
    mov byte ptr [bx+6],75h
    
    mov byte ptr [bx+7],05h
    
    mov byte ptr [bx+8],5fh
    
    mov byte ptr [bx+9],23h
    
    mov si,1 
    
    mov dl,[bx]
    
    mov dh,00

j1:

    mov al,[bx+si]
    
    cmp al,dl  
    
    jae devam
    
    mov dx,si
    
    mov dh,dl
    
    mov dl,al
    
devam:
    inc si
    
    cmp si,10
    
    jnz j1
    
    
    hlt
    
    


ret




