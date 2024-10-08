
macro open filename, flag, mode 
{
  mov rax, SYS_OPEN
  mov rdi, filename
  mov rsi, flag
  mov rdx, mode
  syscall
}

macro stat filename, struct
{
  push rdi
  push rsi

  mov rax, SYS_STAT
  mov rdi, filename
  mov rsi, struct
  syscall
  
  pop rdi
  pop rsi
}

macro close fd
{
  mov rax, SYS_CLOSE
  mov rdi, fd
  syscall
}