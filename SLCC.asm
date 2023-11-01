%include 'env/_data.inc'
extern my_printf, my_readfile   ;

section .data
  hello db "Hello World"        ;

section .text
  global _start                 ;

_start:
  call my_readfile              ;
  
  ; syscall printf
  mov rsi, hello                ;
  call my_printf                ;

  jmp return                    ;

return:
; return program on sistem
  mov rax, EXIT                   ;
  xor rdi, rdi                  ;
  syscall 