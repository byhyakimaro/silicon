
macro write fd, buf, count
{
  mov rax, SYS_WRITE
  mov rdi, fd
  mov rsi, buf
  mov rdx, count
  syscall
}

macro read fd, buf, count
{
  mov rax, SYS_READ
  mov rdi, fd
  mov rsi, buf
  mov rdx, count
  syscall

  ;size of content
  xor rcx, rcx
  .loop:
    cmp byte [buf + rcx], 0
    je .done
    inc rcx
    jmp .loop
  .done:
}