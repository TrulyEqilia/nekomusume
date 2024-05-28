src: cli lib
	$(LD) $(LDFLAGS) -r -o build/objects/mix.o build/objects/src/lib/mix.o build/objects/src/cli/mix.o

cleanSrc: cleanCli cleanLib

include src/lib/Makefile
include src/cli/Makefile

