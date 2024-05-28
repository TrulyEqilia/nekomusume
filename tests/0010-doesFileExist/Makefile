0010doesFileExist: 0010doesFileExistMix
	$(CC) $(CFLAGS) -o tests/0010-doesFileExist/elf build/objects/tests/0010-doesFileExist/mix.o

0010doesFileExistMix: 0010doesFileExistIndexObject libCommonFsDoesFileExist
	$(LD) $(LDFLAGS) -r -o build/objects/tests/0010-doesFileExist/mix.o build/objects/tests/0010-doesFileExist/index.o build/objects/src/lib/common/fs/doesFileExist.o

0010doesFileExistIndexObject:
	$(CC) $(CFLAGS) -c -o build/objects/tests/0010-doesFileExist/index.o tests/0010-doesFileExist/index.c

0010doesFileExistRun: 0010doesFileExist
	tests/0010-doesFileExist/elf

clean0010doesFileExist:
	rm -f tests/0010-doesFileExist/elf
	rm -f build/objects/tests/0010-doesFileExist/mix.o
	rm -f build/objects/tests/0010-doesFileExist/index.o
