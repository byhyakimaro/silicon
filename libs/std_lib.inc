SYS_WRITE = 1
SYS_EXIT = 60
STDOUT = 1

macro write fd, buf, count
{
  mov rax, SYS_WRITE
  mov rdi, fd
  mov rsi, buf
  mov rdx, count    
  syscall
}

macro exit code
{
  mov rax, SYS_EXIT
  mov rdi, code
  syscall
}