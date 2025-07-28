program: main.o
	ld -o program main.o

main.o: hello.asm
	nasm -f elf64 -o main.o hello.asm

clean:
	rm -f main.o program