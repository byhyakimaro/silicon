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

  stat filename, stat_data
  mov rdi, stat_data
  add rdi, 48
  mov r10, [rdi]

  malloc ptr_to_buffer, rsi
  
  open filename, O_RDONLY, ch_file
  mov rdi, rax
  cmp rdi, 0
  jl error_open
  
  read rdi, ptr_to_buffer, r10
  cmp rax, 0
  jle error_open

  write STDOUT, ptr_to_buffer, rcx
  close rdi

  free ptr_to_buffer
  exit 0

segment readable writeable
  filename db 'script.sl', 0
  ptr_to_buffer dq 0
  stat_data dq 0
  ch_file dd 0

  err_open db 'error open file', 0xA
  err_open_sz = $-err_open
