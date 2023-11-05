
macro exit code
{
  mov rax, SYS_EXIT
  mov rdi, code
  syscall
}

macro malloc ptr, size
{
  mov rdi, 0          ; Endereço base para alocar memória (0 indica que o kernel deve escolher)
  mov rsi, size       ; Tamanho em bytes
  mov rdx, 0x7        ; Permissões de leitura, escrita e execução
  mov r10, 0x22       ; Flags (MAP_PRIVATE | MAP_ANONYMOUS)
  mov r8, -1          ; Descritor de arquivo (ignorado no modo MAP_ANONYMOUS)
  mov r9, 0           ; Offset (ignorado no modo MAP_ANONYMOUS)
  mov rax, SYS_MMAP   ; Número da syscall para mmap
  syscall
  ; Verifique se a chamada de sistema falhou (rax deve ser negativo em caso de erro)
  js exit_error       ; Se rax é negativo, ocorreu um erro
  ; Atualize o ponteiro com o endereço da memória alocada
  mov [ptr], rax
}

macro free ptr
{
  mov rdi, [ptr]       ; Endereço da memória alocada
  mov rsi, 0x1000      ; Tamanho em bytes (pode ser qualquer valor maior que 0)
  mov rax, 11          ; Número da syscall para munmap
  syscall
  ; Verifique se a chamada de sistema falhou (rax deve ser negativo em caso de erro)
  test rax, rax
  js exit_error       ; Se rax é negativo, ocorreu um erro
  ; Zere o ponteiro para indicar que a memória foi liberada
  mov [ptr], 0
}

exit_error:
  exit -1