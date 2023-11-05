
macro open filename, flag, mode 
{
  mov rax, SYS_OPEN
  mov rdi, filename
  mov rsi, flag
  mov rdx, mode
  syscall
}

macro stat filename, stat_data
{
  mov rax, SYS_STAT
  mov rdi, filename
  mov rsi, struct
  syscall
}

macro close fd
{
  mov rax, SYS_CLOSE
  mov rdi, fd
  syscall
}