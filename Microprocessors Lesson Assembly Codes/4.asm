PORTA EQU 110 ; Klayveden giris yapmaya yarayan sanal giris portu
PORTB EQU 199 ; Sanal cikis portu, diplay


org 100h
MOV SI,1 ;displayde gosterilecek sayac degeri
MOV CX,1 ; artis miktari
tekrar:
 MOV DX,PORTA
 IN AL,DX ;Giris portundan klavyeden girilen degeri oku

 cbw ;ax registerindeki byte worde çcevir
 MOV CX,AX ;klavyeden girilen artis miktarini yedekle

 ADD SI,CX ;sayactaki degeri guncelle

 MOV DX,PORTB
 MOV AX,SI
 OUT PORTB,AX ;sayacytaki degeri diplaye tasi
 CALL DELAY ;displaydeki degerin gorunebilmesi icin gecikme
 JMP tekrar
ret
DELAY PROC
 PUSH CX ; ana programda kullanilan registerlari yigina yedekle
 MOV CX,020H
J1:
 NOP  ;gecikme saglar
 NOP
 LOOP J1


 POP CX ;yeeklenen reg yigindan geri cek
 RET

DELAY ENDP 