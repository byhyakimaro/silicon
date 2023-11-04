format ELF64 executable

include 'libs/references.inc'
include 'libs/std_lib.inc'
include 'libs/fs_lib.inc'

buffer_size equ 1024
buffer rb buffer_size

segment readable executable
entry main
main:
  ;write STDOUT, msg, msg_lenght
  open filename, O_RDONLY, chmod
  exit STDOUT, exit_c, exit_c_lenght, 0

segment readable writeable
  exit_c db 'compiler ended process',0xA
  exit_c_lenght = $-exit_c
  
  filename db 'test/script.sl', 0x10
  chmod dd 0664