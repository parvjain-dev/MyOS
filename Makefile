SRC = src/boot.asm
IMG = build/boot.img

all: $(IMG)

$(IMG): $(SRC)
	nasm -f bin $(SRC) -o $(IMG)

run: $(IMG)
	qemu-system-x86_64 -drive format=raw,file=$(IMG)

clean:
	rm -f $(IMG)
