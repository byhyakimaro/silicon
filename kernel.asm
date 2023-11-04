format ELF64 executable

include 'libs/std_lib.inc'

segment readable executable
entry main
main:
  write STDOUT, msg, msg_lenght
  exit 0

segment readable writeable
  msg db 'Hello 64-bit world!',0xA
  msg_lenght = $-msg