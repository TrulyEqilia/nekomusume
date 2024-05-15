CC=clang
CC2=gcc
LD=ld

CFLAGS=-Wall -Wextra -Wpedantic -Og -ggdb3 -fPIC -fstack-clash-protection
LDFLAGS=

entry: cli lib
	$(LD) $(LDFLAGS) -r -o objects/src/mix.o objects/src/cli/mix.o objects/src/lib/mix.o
	$(CC) $(LDFLAGS) -o bins/nekomusume objects/src/mix.o

cli: cliMain cliHelp cliDatabase
	$(LD) $(LDFLAGS) -r -o objects/src/cli/mix.o objects/src/cli/main.o objects/src/cli/help.o

cliMain:
	$(CC) $(CFLAGS) -c -o objects/src/cli/main.o src/cli/main.c

cliHelp:
	$(CC) $(CFLAGS) -c -o objects/src/cli/help.o src/cli/help.c

cliDatabase:
	$(CC) $(CFLAGS) -c -o objects/src/cli/database.o src/cli/database.c

lib: libCommon
	$(LD) $(LDFLAGS) -r -o objects/src/lib/mix.o objects/src/lib/common/mix.o

libCommon: libCommonFs libCommonChar
	$(LD) $(LDFLAGS) -r -o objects/src/lib/common/mix.o objects/src/lib/common/fs/mix.o objects/src/lib/common/char/mix.o
	$(CC) $(CFLAGS) -shared -o objects/src/lib/common/mix.so objects/src/lib/common/mix.o

libCommonChar: libCommonCharGetFormalUsername
	$(LD) $(LDFLAGS) -r -o objects/src/lib/common/char/mix.o objects/src/lib/common/char/getFormalUsername.o

libCommonCharGetFormalUsername:
	$(CC) $(CFLAGS) -c -o objects/src/lib/common/char/getFormalUsername.o src/lib/common/char/getFormalUsername.c

libCommonFs: libCommonFsDoesFileExist libCommonFsLockFile libCommonFsUnlockFile
	$(LD) $(LDFLAGS) -r -o objects/src/lib/common/fs/mix.o objects/src/lib/common/fs/doesFileExist.o objects/src/lib/common/fs/lockFile.o objects/src/lib/common/fs/unlockFile.o

libCommonFsDoesFileExist:
	$(CC) $(CFLAGS) -c -o objects/src/lib/common/fs/doesFileExist.o src/lib/common/fs/doesFileExist.c

libCommonFsLockFile:
	$(CC) $(CFLAGS) -c -o objects/src/lib/common/fs/lockFile.o src/lib/common/fs/lockFile.c

libCommonFsUnlockFile:
	$(CC) $(CFLAGS) -c -o objects/src/lib/common/fs/unlockFile.o src/lib/common/fs/unlockFile.c

tests: 0010-doesFileExist
	tests/0010-doesFileExist/elf

0010-doesFileExist: libCommonFsDoesFileExist
	$(CC) $(CFLAGS) -c -o objects/tests/0010-doesFileExist.o tests/0010-doesFileExist/index.c
	$(LD) $(LDFLAGS) -r -o tests/0010-doesFileExist/index.o objects/tests/0010-doesFileExist.o objects/src/lib/common/fs/doesFileExist.o
	$(CC) $(LDFLAGS) -o tests/0010-doesFileExist/elf tests/0010-doesFileExist/index.o

clean: cleanObjects cleanTests
	rm -f bins/nekomusume 

cleanTests:
	rm -f tests/0010-doesFileExist/elf tests/0010-doesFileExist/mix.o tests/0010-doesFileExist/mix tests/0010-doesFileExist/index.o

cleanObjects:
	rm -f objects/src/cli/main.o objects/src/lib/common/fs/doesFileExist.o objects/src/lib/common/fs/lockFile.o objects/src/lib/common/fs/unlockFile.o objects/src/cli/version.o objects/src/cli/help.o objects/src/cli/database.o
	rm -f objects/src/lib/common/fs/mix.o objects/src/lib/common/mix.o objects/src/lib/mix.o objects/src/cli/mix.o objects/src/mix.o objects/mix.o 
	rm -f objects/src/lib/common/char/getFormalUsername.o objects/src/lib/common/char/mix.o objects/src/lib/common/fs/mix.so objects/src/lib/common/mix.so
	rm -f objects/src/lib/common/fs/doesFileExist.o objects/tests/0010-doesFileExist.o 
