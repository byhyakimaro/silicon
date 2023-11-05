
macro exit code
{
  mov rax, SYS_EXIT
  mov rdi, code
  syscall
}

