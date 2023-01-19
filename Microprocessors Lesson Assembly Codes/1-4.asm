
org 100h
    
    mov bx,0200h
    
    mov byte ptr[bx],0ffh
    
    mov byte ptr [bx+1],0a7h
    
    mov byte ptr [bx+2],54h
    
    mov byte ptr [bx+3],097h
    
    mov byte ptr [bx+4],87h
    
    mov byte ptr [bx+5],33h
    
    mov byte ptr [bx+6],75h
    
    mov byte ptr [bx+7],05h
    
    mov byte ptr [bx+8],07h
    
    mov byte ptr [bx+9],23h
    
    mov si,1 
    
    mov dl,[bx]
    
    mov dh,00 
    
    push dx

j1:

    mov al,[bx+si]
    
    cmp al,dl  
    
    jge devam
    
    mov dx,si
    
    mov dh,dl
               
    mov dl,al
    
    push ax  ;yeni enl'yi yigina iter || 16 bit kabul eder
    
    
    
devam:

    inc si
    
    cmp si,10
    
    jnz j1
    
    pop cx ;16 bit kabul  ||cl red
    
    pop cx 
    
    pop cx
     
    hlt
    
ret




