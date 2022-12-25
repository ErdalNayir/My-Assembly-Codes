; Erdal Nayir tarafindan olusturuldu


org 100h 

 
MOV BX,0200H ;Dizinin baslangic adresi veriler 0200h ile 209h arasinda tutulacak

   
;Rastgele sayilar yerlestiriliyor
MOV BYTE PTR [BX],05H
MOV BYTE PTR [BX+1],06H      
MOV BYTE PTR [BX+2],08H
MOV BYTE PTR [BX+3],02H
MOV BYTE PTR [BX+4],04H
MOV BYTE PTR [BX+5],09H
MOV BYTE PTR [BX+6],07H
MOV BYTE PTR [BX+7],03H
MOV BYTE PTR [BX+8],10H
MOV BYTE PTR [BX+9],01H  
;Yerlestirme tamamlandi 



MOV DX,0 ;Duvar gorevi gorecek olan register  
MOV CX,0 ;En kucuk degerin indeksini tutacak

IndexArttir:    
    MOV SI,DX ;SI ile dizide gezinebiliriz    
    MOV AL,[BX+SI] ;Baslangic olarak diznin ilk elemaninini bu registera atadik
    JMP KucukBul

KucukBul: ;ilk eleman sirayla diger elemanlarla kiyaslaniyor
    MOV AH,[BX+SI];siradaki eleman buraya tasinir
    
    CMP AL,AH ;var olan eleman zaten kucukse kiyasa devam et  
    JB DevamKiyas 
    
    MOV AL,AH ;en kucugu AL icinde sakliyoruz  
    MOV CX,SI ;en kucuk degerin indexi
    

DevamKiyas:
    INC SI ;Index 1 arttirilir
    
    CMP SI,10 ;10 tane eleman oldugundan SI 10 dan kucuk olmali   
    
    JNZ KucukBul
                  
    ;Eger SI 10 esit olduysa    
    
    
    ;YER DEGISTIRME KISMI
    MOV SI,DX; SI ilk degere sifirlandi 
    MOV AH,[BX+SI] ;en bastaki deger AH icinde saklandi
    
    MOV [BX+SI],AL; en kucuk deger en basa tasindi
    MOV SI,CX; SI'yi en kucuk indexe esitliyoruz
    MOV [BX+SI],AH ; En bastaki deger en kucuk sayinin bulundugu yere tasindi   
    
    
    ;DUVAR DEGERI ARTTIRMA VE KONTROLU
    INC DX ; DX 1 arttirilir
    
    CMP DX,10  ;DX 10'dan kucuk olmali
    JNZ IndexArttir ;Kosul saglanirsa basa don
    
    HLT ;kosul saglanmazsa kodu durdur
    
    


ret




