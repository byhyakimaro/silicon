
macro write fd, buf, count
{
  mov rax, SYS_WRITE
  mov rdi, fd
  mov rsi, buf
  mov rdx, count
  syscall
}

macro open filename, flag, mode 
{
  mov rax, SYS_OPEN
  mov rdi, filename
  mov rsi, flag
  mov rdx, mode
  syscall
}

macro close fd
{
  mov rax, SYS_CLOSE
  mov rdi, fd
  syscall
}

macro read fd, buf, count
{
  mov rax, SYS_READ
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