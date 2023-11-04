
macro exit_e code, error
{
  mov rax, SYS_WRITE
  mov rdi, STDOUT
  mov rsi, error
  mov rdx, $-error
  syscall

  mov rax, SYS_EXIT
  mov rdi, code
  syscall
}