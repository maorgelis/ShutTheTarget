                 ; Program: graph.asm
.MODEL small
.STACK 100h

.DATA  

;=========================================
; Basic program to draw a circle
;=========================================
 mode db 13h ;
 x_center dw ?
 y_center dw ?
 y_value dw 0
 x_value dw ? ;r
 decision dw 0
 color db ? ;1=blue
 
 x1 dw ?
 y1 dw ?
 w dw ?
 h dw ? 

 counter db ?
  
 xline dw ?
 yline dw ?
 wline dw ?


 TempW dw ? 
 pointX dw ? 
 pointY dw ?
 point1X dw ? 
 point1Y dw ?
 point2X dw ? 
 point2Y dw ?
 Colore db ? 
    
 p1 dw ?
 p2 dw ?
 p3 dw ?
 p4 dw ?
    
 p11 dw ?
 p22 dw ?
 p33 dw ?
 p44 dw ? 
 
crlf db 13,10,'$' 
msg1 db  ' __  __    _    ___  ____     ____ _____ _     ___ ____   $'   ,13,10
msg2 db  '|  \/  |  / \  / _ \|  _ \   / ___| ____| |   |_ _/ ___|  $'   ,13,10
msg3 db  '| |\/| | / _ \| | | | |_) | | |  _|  _| | |    | |\___ \  $'   ,13,10
msg4 db  '| |  | |/ ___ \ |_| |  _ <  | |_| | |___| |___ | | ___) | $'   ,13,10
msg5 db  '|_|  |_/_/   \_\___/|_| \_\  \____|_____|_____|___|____/  $'   ,13,10
msg6 db  '                                                          $'   ,13,10
  

msg7 db "  ____  _   _ _   _ _____    ",13,10,         " / ___|| | | | | | |_   _|",13,10,            " \___ \| |_| | | | | | |",13,10,              "  ___) |  _  | |_| | | |",13,10,              " |____/|_| |_|\___/  |_|",13,10,              " |_   _| | | | ____|",13,10,              "   | | | |_| |  _|",13,10,                    "   | | |  _  | |___",13,10,                   "  _|_|_|_| |_|_____| ____ _____ _____ ",13,10," |_   _|/ \  |  _ \ / ___| ____|_   _|",13,10,"   | | / _ \ | |_) | |  _|  _|   | |",13,10,  "   | |/ ___ \|  _ <| |_| | |___  | |",13,10,  "   |_/_/   \_\_| \_\\____|_____| |_|$",13,10,  
                                     
 
 
 
 
 
 
 
 
 
                                                             
         
;=========================================
.CODE
 circle proc
 
;==========================
 mov bx, x_value
 mov ax,2
 mul bx
 mov bx,3
 sub bx,ax ; E=3-2r
 mov decision,bx
 
 mov al,color ;color goes in al
 mov ah,0ch
 
drawcircle:
 mov al,color ;color goes in al
 mov ah,0ch
 
 mov cx, x_value ;Octonant 1
 add cx, x_center ;( x_value + x_center,  y_value + y_center)
 mov dx, y_value
 add dx, y_center
 int 10h
; 
 mov cx, x_value ;Octonant 4
 neg cx
 add cx, x_center ;( -x_value + x_center,  y_value + y_center)
 int 10h
; 
 mov cx, y_value ;Octonant 2
 add cx, x_center ;( y_value + x_center,  x_value + y_center)
 mov dx, x_value
 add dx, y_center
 int 10h
; 
 mov cx, y_value ;Octonant 3
 neg cx
 add cx, x_center ;( -y_value + x_center,  x_value + y_center)
 int 10h
; 
 mov cx, x_value ;Octonant 8
 add cx, x_center ;( x_value + x_center,  -y_value + y_center)
 mov dx, y_value
 neg dx
 add dx, y_center
 int 10h
; 
 mov cx, x_value ;Octonant 5
 neg cx
 add cx, x_center ;( -x_value + x_center,  -y_value + y_center)
 int 10h

 mov cx, y_value ;Octonant 7
 add cx, x_center ;( y_value + x_center,  -x_value + y_center)
 mov dx, x_value
 neg dx
 add dx, y_center
 int 10h
 
 mov cx, y_value ;Octonant 6
 neg cx
 add cx, x_center ;( -y_value + x_center,  -x_value + y_center)
 int 10h
 


condition1:
 cmp decision,0
 jg condition2      
 ;e<0
 mov cx, y_value
 mov ax, 2
 imul cx ;2y
 add ax, 3 ;ax=2y+3
 mov bx, 2
 mul bx  ; ax=2(2y+3)
 add decision, ax
 mov bx, y_value
 mov dx, x_value
 cmp bx, dx
 ja end  
 inc y_value
 jmp drawcircle

condition2:
 ;e>0
 mov cx, y_value 
 mov ax,2
 mul cx  ;cx=2y
 mov bx,ax
 mov cx, x_value
 mov ax, -2
 imul cx ;cx=-2x
 add bx,ax
 add bx,5;bx=5-2z+2y
 mov ax,2
 imul bx ;ax=2(5-2z+2y)       
 add decision,ax
 mov bx, y_value
 mov dx, x_value
 cmp bx, dx
 ja end
 dec x_value
 inc y_value
 jmp drawcircle


 
end:
ret
 circle endp
 
 
drawline proc
    push BP     ; save BP on stack
    mov BP, SP  ; set BP to current SP     
    pusha
    mov cx, [bp+8]
    add cx, [bp+4]     ; column
    mov dx, [bp+6]     ; row
    mov al, [color]    
line: mov ah, 0ch      ; put pixel
    int 10h
    
    dec cx
    cmp cx, [bp+8]
    ja line        
    popa
    POP BP          ; restore BP from stack
    RET 6           ; return from the function and clean up the stack 
drawline endp

  
 Macro DrawLine2DDY p1X, p1Y, p2X, p2Y
   
	local l1, lp, nxt
	mov dx, 1
	mov ax, [p1X]
	cmp ax, [p2X]
	jbe l1
	neg dx ; turn delta to -1
l1:
	
	mov ax, [p1X]
	mov [pointX], ax
	mov ax, [p1Y]
	mov [pointY], ax
	mov bx, [p2Y]
	sub bx, [p1Y]
	absolute bx
	mov cx, [p2X]
	sub cx, [p1X]
	absolute cx
	
	mov ax, [p2Y]
	shr ax, 1 ; div by 2 
	neg ax
	add ax,bx
	mov [TempW], ax
	
	mov ax, [p2Y]
lp:
	pusha
	call PIXEL
	popa
	inc [pointY]
	cmp [TempW], 0
	jl nxt
	sub [TempW], bx ; bx = (p2Y - p1Y) = deltay
	add [pointX], dx ; dx = delta
nxt:
	add [TempW], cx ; cx = abs(p2X - p1X) = daltax
	cmp [pointY], ax ; ax = p2Y
	jne lp
	call PIXEL
ENDM DrawLine2DDY
;---------------------------------------------
; case: DeltaX is bigger than DeltaY		  
; input: p1X p1Y,		            		  
; 		 p2X p2Y,		           		      
;		 Color -> variable                    
; output: line on the screen                  
;---------------------------------------------
Macro DrawLine2DDX p1X, p1Y, p2X, p2Y
	local l1, lp, nxt
	
	
	
	mov dx, 1
	mov ax, [point1Y]
	cmp ax, [point2Y]
	jbe l1
	neg dx ; turn delta to -1
l1:
	
	mov ax, [point1X]
	mov [pointX], ax
	mov ax, [point1Y]
	mov [pointY], ax
	mov bx, [point2X]
	sub bx, [point1X]
	absolute bx
	mov cx, [point2Y]
	sub cx, [point1Y]
	absolute cx    
	
	
	mov ax, bx
	shr ax, 1 ; div by 2
	neg ax
	add ax,cx
	
	mov [TempW], ax
	
	mov ax, [point2X]
lp:
	pusha
	call PIXEL
	popa
	inc [pointX]
	cmp [TempW], 0
	jl nxt
	sub [TempW], bx ; bx = abs(p2X - p1X) = deltax
	add [pointY], dx ; dx = delta
nxt:
	add [TempW], cx ; cx = abs(p2Y - p1Y) = deltay
	cmp [pointX], ax ; ax = p2X
	jne lp
	call PIXEL
	

ENDM DrawLine2DDX
Macro absolute a
	local l1
	cmp a, 0
	jge l1
	neg a
l1:
Endm
.MODEL small

; procedures
;---------------------------------------------
; input: point1X point1Y,         
; 		 point2X point2Y,         
;		 Color                        
; output: line on the screen                  
;---------------------------------------------
PROC DrawLine2D
    pusha
	mov cx, [bp+8]
	sub cx, [bp+6]
	absolute cx
	mov bx, [bp+4]
	sub bx, [bp+2]
	absolute bx
	cmp cx, bx
	jae DrawLine2Dp1 ; deltaX > deltaY
	mov ax, [bp+8]
	mov bx, [bp+6]
	mov cx, [bp+4]
	mov dx, [bp+2]
	cmp cx, dx
	jbe DrawLine2DpNxt1 ; point1Y <= point2Y
	xchg ax, bx
	xchg cx, dx
DrawLine2DpNxt1:
	mov [bp+8], ax
	mov [bp+6], bx
	mov [bp+4], cx
	mov [bp+2], dx
	DrawLine2DDY point1X, point1Y, point2X,point2Y
	ret
DrawLine2Dp1:
	mov ax, [bp+8]
	mov bx, [bp+6]
	mov cx, [bp+4]
	mov dx, [bp+2]
	cmp ax, bx
	jbe DrawLine2DpNxt2 ; point1X <= point2X
	xchg ax, bx
	xchg cx, dx
DrawLine2DpNxt2:
	mov [bp+8], ax
	mov [bp+6], bx
	mov [bp+4], cx
	mov [bp+2], dx
	DrawLine2DDX point1X, point1Y, point2X, point2Y
	popa 
	ret 8	
	
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	
ENDP DrawLine2D
;-----------------------------------------------
; input: pointX pointY,      			
;           Color				
; output: point on the screen			
;-----------------------------------------------
PROC PIXEL
	mov bh,0h
	mov cx,[pointX]
	mov dx,[pointY]
	mov al,Colore
	mov ah,0Ch
	int 10h
	ret 
ENDP PIXEL 

     
proc LaunchArrow
    pusha
    mov [wline],50 
    mov [color], 0
    push xline
    push yline
    push wline
    call drawline 
    
    mov Colore, 0
    mov ax, p11
	mov point1X, ax
	push point1X   
	mov bx, p22
	mov point2X, bx
	push point2X
	mov cx, p33 
	mov point1Y, cx
	push point1Y
	mov dx, p44
	mov point2Y, dx
	push point2Y
	call DrawLine2D
	
	mov ax, point1X
	mov bx, point2X
	mov cx, point1Y
	mov dx, point2Y
	
	mov p11, ax
	mov p22, bx
	mov p33, cx
	mov p44, dx
	  
    
    mov Colore, 0
    mov ax, p1
	mov point1X, ax
	push point1X   
	mov bx, p2
	mov point2X, bx
	push point2X
	mov cx, p3 
	mov point1Y, cx
	push point1Y
	mov dx, p4
	mov point2Y, dx
	push point2Y
	call DrawLine2D
	
	mov ax, point1X
	mov bx, point2X
	mov cx, point1Y
	mov dx, point2Y
	
	mov p1, ax
	mov p2, bx
	mov p3, cx
	mov p4, dx
    
    mov Colore, 15
    mov  ax, p11
	mov  point1X,ax
	add  point1X,60
    push point1X   
    mov  bx, p22
	mov  point2X,bx
	add  point2X,60
	push point2X
	mov  cx, p33
	mov  point1Y,cx
	push point1Y   
	mov  dx,p44 
	mov  point2Y,dx
	push point2Y
	call DrawLine2D  
    mov ax, point1X
	mov bx, point2X
	mov cx, point1Y
	mov dx, point2Y
	
	mov p11, ax
	mov p22, bx
	mov p33, cx
	mov p44, dx
    
    mov Colore, 15
    mov  ax, p1
	mov  point1X,ax
	add  point1X,60
    push point1X   
    mov  bx, p2
	mov  point2X,bx
	add  point2X,60
	push point2X
	mov  cx, p3
	mov  point1Y,cx
	push point1Y   
	mov  dx,p4 
	mov  point2Y,dx
	push point2Y
	call DrawLine2D  
    mov ax, point1X
	mov bx, point2X
	mov cx, point1Y
	mov dx, point2Y
	
	mov p1, ax
	mov p2, bx
	mov p3, cx
	mov p4, dx
     
 
    add [xline],60
    mov [wline],50
    mov [color],15
    push xline
    push yline
    push wline
    call drawline
    
    mov cx,3 
    popa
    ret  
                  
endp LaunchArrow
 
 
 
 proc delay
	pusha
	mov cx, 03h   ;High Word
	mov dx, 4240h ;Low Word
	mov ah, 86h   ;Wait
	int 15h
	popa
	ret
endp delay
start: 
 
 mov ax,@DATA
 mov ds, ax
 
  
    lea DX,msg1 
    mov AH,09h 
    int 21h
    lea DX,crlf 
    mov AH,09h 
    int 21h 
    lea DX,msg2 
    mov AH,09h 
    int 21h
    lea DX,crlf 
    mov AH,09h 
    int 21h  
    lea DX,msg3 
    mov AH,09h 
    int 21h
    lea DX,crlf 
    mov AH,09h 
    int 21h  
    lea DX,msg4 
    mov AH,09h 
    int 21h
    lea DX,crlf 
    mov AH,09h 
    int 21h  
    lea DX,msg5 
    mov AH,09h 
    int 21h
    lea DX,crlf 
    mov AH,09h 
    int 21h  
    lea DX,msg6 
    mov AH,09h 
    int 21h
    lea DX,crlf 
    mov AH,09h 
    int 21h 
    lea DX,msg7 
    mov AH,09h 
    int 21h
 
    call delay
 mov ah,0 ;subfunction 0
 mov al,mode ;select mode 13h 
 int 10h ;call graphics interrupt

 mov [x_center],280
 mov [y_center],100 
 mov [x_value],20
 mov [y_value],0
 mov [color],15
 call circle
 
 mov [x_center],280
 mov [y_center],100 
 mov [x_value],10
 mov [y_value],0
 mov [color],15
 call circle
 
   mov [xline], 0
   mov [yline], 30
   mov [wline],50
   push xline
   push yline
   push wline
   call drawline
   
    
    mov Colore, 15
	mov point1X, 40
	push point1X
	mov point2X, 50
	push point2X 
	mov point1Y, 25
	push point1Y
	mov point2Y, 30
	push point2Y
	call DrawLine2D
	
	mov ax, point1X
	mov bx, point2X
	mov cx, point1Y
	mov dx, point2Y
	
	mov p11, ax
	mov p22, bx
	mov p33, cx
	mov p44, dx
    
    mov Colore, 15  
	mov point1X, 40
	push point1X
	mov point2X, 50
	push point2X 
	mov point1Y, 35
	push point1Y
	mov point2Y, 30
	push point2Y
	call DrawLine2D
	
	mov ax, point1X
	mov bx, point2X
	mov cx, point1Y
	mov dx, point2Y
	
	mov p1, ax
	mov p2, bx
	mov p3, cx
	mov p4, dx
 
	Redraw:
    ; is key press    
    mov ah,01h
    int 16h
    jz Redraw
    ; Get the pressed key
    mov ah,00h
    int 16h
    ; check it is an arrow
    cmp al,0
    jne Redraw

    
    cmp ah,48h
    je MoveUp 
    
    cmp ah,50h
    je MoveDown
    
    cmp ah, 4Bh
    je LaunchArrowLabel
    
    MoveUp:
    
   
    mov [wline],50 
    mov [color], 0
    push xline
    push yline
    push wline
    call drawline 
    
    mov Colore, 0
    mov ax, p11
	mov point1X, ax
	push point1X   
	mov bx, p22
	mov point2X, bx
	push point2X
	mov cx, p33 
	mov point1Y, cx
	push point1Y
	mov dx, p44
	mov point2Y, dx
	push point2Y
	call DrawLine2D
	
	mov ax, point1X
	mov bx, point2X
	mov cx, point1Y
	mov dx, point2Y
	
	mov p11, ax
	mov p22, bx
	mov p33, cx
	mov p44, dx
	  
    
    mov Colore, 0
    mov ax, p1
	mov point1X, ax
	push point1X   
	mov bx, p2
	mov point2X, bx
	push point2X
	mov cx, p3 
	mov point1Y, cx
	push point1Y
	mov dx, p4
	mov point2Y, dx
	push point2Y
	call DrawLine2D
	
	mov ax, point1X
	mov bx, point2X
	mov cx, point1Y
	mov dx, point2Y
	
	mov p1, ax
	mov p2, bx
	mov p3, cx
	mov p4, dx
	
	
    mov Colore, 15 
    mov  ax, p11
    mov  point1X,ax
    push point1X   
    mov  bx, p22
	mov  point2X,bx
	push point2X
	mov  cx, p33
	mov  point1Y,cx
	sub  point1Y,10
	push point1Y   
	mov  dx,p44 
	mov  point2Y,dx
	sub  point2Y,10
	push point2Y
	call DrawLine2D
    mov ax, point1X
	mov bx, point2X
	mov cx, point1Y
	mov dx, point2Y
	
	mov p11, ax
	mov p22, bx
	mov p33, cx
	mov p44, dx
    
    
    mov Colore, 15
    mov  ax, p1
    mov  point1X,ax
    push point1X   
    mov  bx, p2
	mov  point2X,bx
	push point2X
	mov  cx, p3
	mov  point1Y,cx
	sub  point1Y,10
	push point1Y   
	mov  dx,p4 
	mov  point2Y,dx
	sub  point2Y,10
	push point2Y
	call DrawLine2D  
    mov ax, point1X
	mov bx, point2X
	mov cx, point1Y
	mov dx, point2Y
	
	mov p1, ax
	mov p2, bx
	mov p3, cx
	mov p4, dx
     
 
    sub [yline],10
    mov [wline],50
    mov [color],15
    push xline
    push yline
    push wline
    call drawline
    
    jmp Redraw
    
    MoveDown:
    
     
    mov [wline],50 
    mov [color], 0
    push xline
    push yline
    push wline
    call drawline 
    
    mov Colore, 0
    mov ax, p11
	mov point1X, ax
	push point1X   
	mov bx, p22
	mov point2X, bx
	push point2X
	mov cx, p33 
	mov point1Y, cx
	push point1Y
	mov dx, p44
	mov point2Y, dx
	push point2Y
	call DrawLine2D
	
	mov ax, point1X
	mov bx, point2X
	mov cx, point1Y
	mov dx, point2Y
	
	mov p11, ax
	mov p22, bx
	mov p33, cx
	mov p44, dx
	  
    
    mov Colore, 0
    mov ax, p1
	mov point1X, ax
	push point1X   
	mov bx, p2
	mov point2X, bx
	push point2X
	mov cx, p3 
	mov point1Y, cx
	push point1Y
	mov dx, p4
	mov point2Y, dx
	push point2Y
	call DrawLine2D
	
	mov ax, point1X
	mov bx, point2X
	mov cx, point1Y
	mov dx, point2Y
	
	mov p1, ax
	mov p2, bx
	mov p3, cx
	mov p4, dx
	
	
    mov Colore, 15 
    mov  ax, p11
    mov  point1X,ax
    push point1X   
    mov  bx, p22
	mov  point2X,bx
	push point2X
	mov  cx, p33
	mov  point1Y,cx
	add  point1Y,10
	push point1Y   
	mov  dx,p44 
	mov  point2Y,dx
	add  point2Y,10
	push point2Y
	call DrawLine2D
    mov ax, point1X
	mov bx, point2X
	mov cx, point1Y
	mov dx, point2Y
	
	mov p11, ax
	mov p22, bx
	mov p33, cx
	mov p44, dx
    
    
    mov Colore, 15
    mov  ax, p1
    mov  point1X,ax
    push point1X   
    mov  bx, p2
	mov  point2X,bx
	push point2X
	mov  cx, p3
	mov  point1Y,cx
	add  point1Y,10
	push point1Y   
	mov  dx,p4 
	mov  point2Y,dx
	add  point2Y,10
	push point2Y
	call DrawLine2D  
    mov ax, point1X
	mov bx, point2X
	mov cx, point1Y
	mov dx, point2Y
	
	mov p1, ax
	mov p2, bx
	mov p3, cx
	mov p4, dx
     
 
    add [yline],10
    mov [wline],50
    mov [color],15
    push xline
    push yline
    push wline
    call drawline
    
     jmp Redraw
 
    LaunchArrowLabel:
    mov cx,4 
    lop:
    call LaunchArrow
    loop lop
   
   cmp point2Y, 90
   jb exit
   
   cmp point2Y, 110
   ja exit
   
   yellowcircel:                
 mov [x_center],280
 mov [y_center],100 
 mov [x_value],20
 mov [y_value],0
 mov [color],0
 call circle
              
 mov [x_center],280
 mov [y_center],100     
 mov [x_value],20
 mov [y_value],0
 mov [color],14
 call circle
 
 jmp exit
   
exit:
;wait for keypress
  mov ah,00
  int 16h			

  mov AH,4CH
  int 21h

END start

ret 
