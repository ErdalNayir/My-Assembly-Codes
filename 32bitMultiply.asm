; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt 

;ERDAL NAYIR TARAFINDAN OLUSTURULDU

org 100h       

         
                     
;BELLEKTE VERI TANIMLAMA
mov word ptr [200h],5678h ;carpan alt bitler
mov word ptr [202h],5678h ;carpan ust bitler

mov word ptr [204h],5678h ;carpilan alt bitler
mov word ptr [206h],5678h ;carpilan ust bitler


;Sonuc bitlerini atama
mov word ptr [208h],0000h ;en alt 16 bit
mov word ptr [210h],0000h ;alt 16 bit

mov word ptr [212h],0000h ;ust 16 bit
mov word ptr [214h],0000h ;en ust 16 bit


ResetReg: ;registerlari sifirlar (her ihtimale karsi)
    mov ax,0000h
    mov cx,0000h
    mov dx,0000h 
    mov bx,0000h




StartMultiply: ;Carpimaya basliyoruz
    mov dx,[204h] ;carpilan alt bitler
    mov cx,[206h] ;carpilan ust bitler

    mov si,20h ;dongu degiskeni (16 kez donmesi icin)

Repeat:
    mov ax,[200h] ;ilk turda carpan alt bitler gerekli
    mov di,ax ;carpan bitler kopyalaniyor
    and di,01h ;di'nin en alt biti haric diger bitler sifirlaniyor
    xor di,01h ;Carpanin en anlamsiz biti lojik bir ise zero flag setlenir
    jz AddShift ;zero flag 1 ise carpim sonucunu carpilan ile topla ve bir bit saga kaydir
    
    CLC ;carry flag resetleniyor(sifirlaniyor)       
    
    

Continue:        
    ;SONUC KAYDIRMA ISLEMLERI
    mov ax,[214h] ;sonucun en ust 16 biti ax registerina kopyalaniyor
    rcr ax,1 ;kopyalanan veri bir bit saga kaydiriliyor 
    mov [214h],ax ;veri ilgili bellek adresine geri kopyalaniyor
    
    mov ax,[212h] ;sonucun ust 16 biti ax registerina kopyalaniyor
    rcr ax,1 ;kopyalanan veri bir bit saga kaydiriliyor 
    mov [212h],ax ;veri ilgili bellek adresine geri kopyalaniyor
    
    mov ax,[210h] ;;sonucun alt 16 biti ax registerina kopyalaniyor
    rcr ax,1 ;kopyalanan veri bir bit saga kaydiriliyor 
    mov [210h],ax ;veri ilgili bellek adresine geri kopyalaniyor
    
    mov ax,[208h] ;;sonucun en alt 16 biti ax registerina kopyalaniyor
    rcr ax,1 ;kopyalanan veri bir bit saga kaydiriliyor 
    mov [208h],ax ;veri ilgili bellek adresine geri kopyalaniyor  
                                    
                                    
    ;CARPAN KAYDIRMA ISLEMLERI
    mov ax,[202h] ;carpan ust bitler ax registerina kopyalaniyor
    rcr ax,1 ;kopyalanan veri bir bit saga kaydiriliyor
    mov [202h],ax ;veri ilgili bellek adresine geri kopyalaniyor 
    
    mov ax,[200h] ;;carpan alt bitler ax registerina kopyalaniyor
    rcr ax,1 ;kopyalanan veri bir bit saga kaydiriliyor
    mov [200h],ax ;veri ilgili bellek adresine geri kopyalaniyor
    
    dec si ;dongu degiskeni 1 azaltiliyor
    cmp si,0h ;eger degisken 0 ise kosul saglanir ve zero flag setlenir
    
    jnz Repeat ;zero flag 0 degilse islemleri tekrar et
    jmp EndMultiply ;uygulamayi bitir



AddShift: ;Toplama ve kaydirma asamasi
    add [212h],dx ;sonucun ust 16 bitine carpilan alt bitler ekleniyor
    adc [214h],cx ;sonucun en ust 16 bitine carpilan ust bitler ekleniyor
    jmp Continue ;islemler tekrar ediliyor   
    
    

EndMultiply: ;bellekteki veri registerlara yukleniyor
    mov ax,[214h] ;sonucun en ust 16 biti 
    mov bx,[212h] ;sonucun en alt 16 biti
    mov cx,[210h] ;sonucun ust 16 biti
    mov dx,[208h] ;sonucun alt 16 biti
   

