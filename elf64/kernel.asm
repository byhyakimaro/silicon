format ELF64 executable

include 'libs/references.inc'
include 'libs/std_uni.inc'
include 'libs/std_lib.inc'
include 'libs/std_libfc.inc'

error_open:
  write STDOUT, err_open, err_open_sz
  exit -1

segment readable executable
entry main
main:
  open filename, O_RDONLY, ch_file
  mov rdi, rax
  cmp rdi, 0
  jl error_open

  read rdi, buffer, buffer_size
  cmp rax, 0
  jle error_open
  
  ;size of content
  xor rcx, rcx
  .loop:
    cmp byte [buffer + rcx], 0
    je .done
    inc rcx
    jmp .loop
  .done:

  write STDOUT, buffer, rcx
  close rdi
  exit 0

segment readable writeable
  err_open db 'error open file', 0xA
  err_open_sz = $-err_open

  filename db 'script.sl', 0
  buffer_size = 1024
  buffer rb buffer_size
  ch_file dd 0