; rsi <- endereço do rotulo 'codes', um numero
mov rsi, codes

; rsi <- contéudo da memória começando no endereço 'codes'
; 8 bytes consecutivos são obtidos porque o tamanho de rsi é de 8 bytes
mov rsi, [codes]

; rsi <- endereço de 'codes'
; nesse caso, é equivalente a mov, codes
; em geral, o endereço pode conter vários componentes
lea rsi, [codes + rax]

; rsi <- contéudo da memória, começando em (codes+rax)
mov rsi, [codes + rax]

; rsi <- codes + rax
; equivalente á combinações:
; -- mov rsi, codes
; -- add rsi, rax
; não é possivel fazer isto com um único mov!
lea rsi, [codes + rax]