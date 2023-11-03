section .data
  global WRITE, EXIT, STDOUT
  
  WRITE	equ	1		; the linux WRITE syscall
  EXIT	equ	60		; the linux EXIT syscall
  STDOUT	equ	1		; the file descriptor for standard output (to print/write to)

  LINEBREAK	db 0x0A	; ASCII character 10, a line break
  FORMAT_STRING db "%s", 0x0A, 0  ; Format string printf
  ref_count dd 0                   ; count referenc