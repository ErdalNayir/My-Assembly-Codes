;fibonacci araligi gosterir ornegin 7 icin bh => 05   bl =>  08
org 100h

    mov dl,7
        
    mov al,0
    
    mov bl,1

devam:

    add al,bl 
    
    mov bh,bl
    
    mov bl,al
    
    mov al,bh
    
    
    cmp bl,dl
          
    jbe devam 
    
    
    hlt
ret 