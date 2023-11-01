section .data
  global WRITE, EXIT, STDOUT
  
  WRITE	equ	1		; the linux WRITE syscall
  EXIT	equ	60		; the linux EXIT syscall
  STDOUT	equ	1		; the file descriptor for standard output (to print/write to)