%include 'env/_data.inc'
extern len_rsi

section .text
  global process_end

process_end:
  ; [rdi: status number exit]

  mov rsi, end_compiler_text_format
  
  call len_rsi

  mov rax, WRITE
  mov rdi, STDOUT
  syscall

  mov rax, EXIT
  xor rdi, rdi
  syscall