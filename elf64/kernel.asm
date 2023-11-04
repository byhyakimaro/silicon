format ELF64 executable

include 'libs/references.inc'
include 'libs/parse_error.inc'
include 'libs/std_lib.inc'
include 'libs/fs_lib.inc'

buffer_size equ 1024
buffer rb buffer_size

segment readable executable
entry main
main:
  write STDOUT, msg, msg_lenght
  open filename, O_RDONLY, chmod
  exit 0

segment readable writeable
  msg db 'Hello 64-bit world!',0xA
  msg_lenght = $-msg
  
  filename db 'test/script.sl', 0x10
  chmod dd 0664