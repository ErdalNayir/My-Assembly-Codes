
org 100h
    
    mov bx,0200h
    
    mov dl,29
    
    mov di,00

j1:
    
    mov cl,dl
    
    mov si,0 ;tam bolen adedi
           
           
tekrar:
                      
    mov al,dl
    
    mov ah,0 ;cbw 16 bit yapar
    
    
    div cl
    
    cmp ah,0   
    
    jnz kalanvar
    
    inc si
    
kalanvar:    

    loop tekrar
    
    cmp si,2  
    
    jnz asaldegil
    
    mov [bx+di],dl
    
    inc di
    
asaldegil:
    
    dec dl
    
    cmp dl,1
    
    jnz j1
    
    hlt 
                   
ret




