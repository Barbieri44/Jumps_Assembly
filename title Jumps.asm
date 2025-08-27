title ATV3_2
.model small
.data   
    inicio db "Digite um caractere: $"
    ssair db 10,13, "Aperte ESC para sair $"
    simnumero db 10,13, "O caractere digitado eh um numero! $"
    letraMAI db 10,13, "O caractere digitado eh uma letra Maiuscula! $"
    letramin db 10,13, "O caractere digitado eh uma letra minuscula! $"
    naocaractere db 10,13, "O caractere digitado eh desconhecido $"
.code
 main proc 
    mov ax,@data     ;permite o acesso das variaveis definidas em .DATA
    mov ds,ax
digite:
        mov ah,9
        lea dx,inicio ; imprime a mensagem inicial
        int 21h

        mov ah,1 ; lê o caractere do teclado
        int 21h
        cmp al,27 ; compara com o ESC em hexadecimal 1b h
        je sair

        mov bl,al ; copia o al lido para bl

        cmp bl,30h ;compara com o "0" em hexa para ver se é menor que um numero
        jb naosei ; vai para não sei onde está a mensagem de caractere desconhecido

        cmp bl,39h ;compara com o "9" em hexa para ver se é um numero
        ja maiusc ; vai para numero onde  tem a messagem de numero

        mov ah,9
        lea dx,simnumero
        int 21h
        jmp digite
maiusc:
        cmp bl,41h ; compara com o "A" para ver se ele é ou não uma letra
        jb naosei ; vai para a rotulo não sei

        cmp bl,5ah ; compara com o "Z" em hexa para ver se ele é Maiusculo
        ja minusc
 
        mov ah,9
        lea dx,letraMAI
        int 21h
        jmp digite

minusc:
        cmp bl,61 ; compara com o "a" (minusculo) em hexa para ver se ele se encaixa em uma letra minuscula
        jb naosei

        cmp bl,7ah ; compara com o "z" (minusculo) para ver se ainda é uma letra minuscula

        ja naosei ; se mesmo assim não reconheceu pula para nao sei e faz novamente
        mov ah,9
        lea dx,letramin
        int 21h
        jmp digite

    naosei:
        mov ah,9
        lea dx,naocaractere
        int 21h
        jmp digite

    Sair:
    mov ah,4Ch
    int 21h
main endp
end main
