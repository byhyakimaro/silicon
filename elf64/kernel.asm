format ELF64 executable

include 'libs/references.inc'
include 'libs/std_lib.inc'
include 'libs/fs_lib.inc'

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
  jl error_open
  
  write STDOUT, buffer, rax
  close rdi

  write STDOUT, exit_c, exit_c_sz
  exit 0

segment readable writeable
  exit_c db 'compiler ended process',0xA
  exit_c_sz = $-exit_c

  err_open db 'error open file',0xA
  err_open_sz = $-exit_c

  filename db 'script.sl', 0
  buffer_size = 1024
  buffer rb buffer_size
  ch_file dd 0