
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

mov [200h],12  
mov [201h],43
mov [202h],22
mov [203h],57
mov [204h],98
mov [205h],13
mov [206h],02
mov [207h],69
mov [208h],10
mov [209h],33 


mov si,0   


TekMiCiftMi:
    mov al,[200h+si]  
    mov ah,al ; copy al into ax
    and al,1  
    jz TekSayi     
    jmp CiftSayi
    

TekSayi:
    neg ah; 2's complament           
    call StoreAndIncrement
    
    
CiftSayi:
    not ah; 1's complament
    call StoreAndIncrement  
    
    
Sonuc:
    hlt   
    
    
StoreAndIncrement PROC   ;Sub program declaration
    mov [200h+si], ah    
    inc si  
    cmp si,10
    jz Sonuc  
    jmp TekMiCiftMi   
    ret    
StoreAndIncrement ENDP 

ret




