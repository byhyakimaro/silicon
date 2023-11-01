extern my_printf, my_readfile   ;

section .data
  WRITE	equ	1		; the linux WRITE syscall
  EXIT	equ	60		; the linux EXIT syscall
  STDOUT	equ	1		; the file descriptor for standard output (to print/write to)

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