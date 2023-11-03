%include 'env/_data.inc'
extern my_printf, my_readfile, process_end

section .data
  hello db "Hello World"        ;

section .text
  global _start                 ;

_start:
  call my_readfile              ;
  
  ; syscall printf
  mov rsi, hello                ;
  call my_printf                ;

  xor rdi, rdi                  ; program exit 0
  jmp process_end               ;