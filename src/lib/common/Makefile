libCommon: libCommonFs
	$(LD) $(LDFLAGS) -r -o build/objects/src/lib/common/mix.o build/objects/src/lib/common/fs/mix.o

cleanLibCommon: cleanLibCommonFs
	rm -f build/objects/src/lib/common/mix.o

include src/lib/common/fs/Makefile
