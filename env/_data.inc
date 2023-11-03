section .data
  global WRITE, EXIT, STDOUT
  
  WRITE	equ	1		; the linux WRITE syscall
  EXIT	equ	60		; the linux EXIT syscall
  STDOUT	equ	1		; the file descriptor for standard output (to print/write to)

  LINEBREAK	db 0x0A	; ASCII character 10, a line break
  FORMAT_STRING db "%s", 0x0A, 0  ; Format string printf
  
  ref_count dd 0                   ; count reference
  saved_ptr dq 0                 ; register save and refactory

  end_compiler_text_format db 0x0A, "compilation terminated.", 0x0A, 0

  ref_status_error db "faltal error: no input files", 0x0A, 0  ;error status