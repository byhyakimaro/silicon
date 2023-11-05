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
  ;stat filename, ptr_to_memory
  open filename, O_RDONLY, ch_file
  mov rdi, rax
  cmp rdi, 0
  jl error_open

  read rdi, buffer, buffer_size
  cmp rax, 0
  jle error_open

  malloc ptr_to_memory, 100
  free ptr_to_memory

  write STDOUT, buffer, rcx
  close rdi
  exit 0

segment readable writeable
  filename db 'script.sl', 0
  ch_file dd 0

  err_open db 'error open file', 0xA
  err_open_sz = $-err_open

  buffer_size = 1024
  buffer rb buffer_size
  ptr_to_memory dq 0