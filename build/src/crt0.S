.global _start
.extern main
_start:
 
## here you might want to get the argc/argv pairs somehow and then push
## them onto the stack...
 
# call the user's function
call main
 
# call the 'kill me' syscall to end
movl $0,%eax
int $0x80
 
# loop in case we haven't yet rescheduled
lp:
hlt
jmp lp
