O_RDONLY = 0
O_WRONLY = 1
O_RDWR = 2

SYS_OPEN = 2

macro open filename, flag, mode 
{
  mov rax, SYS_OPEN
  mov rdi, filename
  mov rsi, flag
  mov rdx, mode
  syscall
}
