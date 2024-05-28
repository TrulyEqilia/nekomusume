entry: src
	$(CC) $(CFLAGS) -o bins/nekomusume build/objects/mix.o

clean: cleanTests cleanSrc

include src/Makefile
include tests/Makefile
