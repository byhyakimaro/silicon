format ELF64 executable

include 'libs/references.inc'
include 'libs/std_lib.inc'
include 'libs/fs_lib.inc'

segment readable executable
entry main
main:
  .error_open:
    write STDOUT, err_open, err_open_sz
    exit -1
  
  open filename, O_RDONLY, ch_file
  mov rdi, rax
  cmp rdi, 0
  jl .error_open

  ;read rdi, buffer, buffer_sz
  
  ;write STDOUT, buffer, rax
  ;close rdi

  write STDOUT, exit_c, exit_c_sz
  exit 0

segment readable writeable
  exit_c db 'compiler ended process',0xA
  exit_c_sz = $-exit_c

  err_open db 'error open file',0xA
  err_open_sz = $-exit_c
  
  buffer rb 1024
  buffer_sz = $-buffer

  filename db 'script.sl', 0
  ch_file dd 0