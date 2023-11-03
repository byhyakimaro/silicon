%include 'env/_data.inc'
extern len_rsi, process_end

section .text
  global error_argv

error_argv:
  mov rsi, ref_status_error
  call len_rsi

  mov rax, WRITE            ; Número da syscall para sys_write (1)
  mov rdi, STDOUT            ; Descritor de arquivo para stdout (1)
  syscall               ; Chama o sistema para escrever a string

  mov rdi, -1
  call process_end