format ELF64 executable

include 'libs/references.inc'
include 'libs/std_lib.inc'
include 'libs/fs_lib.inc'

segment readable executable
entry main
main:
  write STDOUT, exit_c, exit_c_sz
  
  open filename, O_RDONLY, ch_file
  mov rdi, rax
  read rdi, buffer, 1024
  
  write STDOUT, buffer, rax
  close rdi

  exit 0

segment readable writeable
  exit_c db 'compiler ended process',0xA
  exit_c_sz = $-exit_c
  
  filename db 'test/script.sl', 0
  buffer rb 1024
  ch_file dd 0