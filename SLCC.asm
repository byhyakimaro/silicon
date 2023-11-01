section .data
  output db "Hello World", 0xA  ;
  outputLen equ $ - output      ;

section .text
  global _start                 ;

_start:
  ; syscall printf
  mov rax, 1                    ;
  mov rdi, 1                    ;
  mov rsi, output               ;
  mov rdx, outputLen            ;
  syscall                       ;

  jmp return                    ;

return:
  ;return program on sistem     ;
  mov rax, 60                   ;
  xor rdi, rdi                  ;
  syscall 