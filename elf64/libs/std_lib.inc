
macro read fd, buf, count
{
  mov rax, SYS_READ
  mov rdi, fd
  mov rsi, buf
  mov rdx, count
}

macro write fd, buf, count
{
  mov rax, SYS_WRITE
  mov rdi, fd
  mov rsi, buf
  mov rdx, count
  syscall
}

macro code
{
  mov rax, SYS_EXIT
  mov rdi, code
  syscall
}