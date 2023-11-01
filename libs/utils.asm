section .text
global my_printf

my_printf:
  mov rax, 1                ; sys_write (1)
  mov rdi, 1                ; stdout (1)
  syscall

  ; end
  ret