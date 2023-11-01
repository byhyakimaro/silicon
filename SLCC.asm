extern my_printf                ;

section .data
  hello db "Hello World", 0xA   ;
  helloLen equ $ - hello        ; lenght string pointer

section .text
  global _start                 ;

_start:
  ; syscall printf
  mov rsi, hello                ;
  mov rdx, helloLen             ; 
  call my_printf                ;

  jmp return                    ;

return:
  ; return program on sistem
  mov rax, 60                   ;
  xor rdi, rdi                  ;
  syscall 