%include 'env/_data.inc'
extern len_rsi

section .text
  global error_argv

error_argv:
  mov rsi, argv_error_ref

  call len_rsi
  
  mov rax, WRITE            ; Número da syscall para sys_write (1)
  mov rdi, STDOUT            ; Descritor de arquivo para stdout (1)
  syscall               ; Chama o sistema para escrever a string

  ret