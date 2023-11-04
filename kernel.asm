format ELF64 executable

include 'libs/std_lib.inc'
include 'libs/fs_lib.inc'

segment readable executable
entry main
main:
  write STDOUT, msg, msg_lenght
  open filename, O_RDONLY, mode
  exit 0

segment readable writeable
  msg db 'Hello 64-bit world!',0xA
  msg_lenght = $-msg
  
  filename db 'test/script.sl', 0x10
  mode dd 0664  ; Permissões de arquivo: rw-rw-r--