CC=clang
LD=ld

CFLAGS=-Wall -Wextra -Wpedantic -Weverything -Og -ggdb3 -fPIC -fstack-clash-protection
LDFLAGS=

entry: cli lib
	$(LD) $(LDFLAGS) -r -o build/objects/src/mix.o build/objects/src/cli/mix.o build/objects/src/lib/mix.o
	$(CC) $(LDFLAGS) -o bins/nekomusume build/objects/src/mix.o

cli: cliMain cliHelp cliDatabase cliDatabaseHelp
	$(LD) $(LDFLAGS) -r -o build/objects/src/cli/mix.o build/objects/src/cli/main.o build/objects/src/cli/help.o build/objects/src/cli/database.o build/objects/src/cli/databaseHelp.o

cliMain:
	$(CC) $(CFLAGS) -c -o build/objects/src/cli/main.o src/cli/main.c

cliHelp:
	$(CC) $(CFLAGS) -c -o build/objects/src/cli/help.o src/cli/help.c

cliDatabase:
	$(CC) $(CFLAGS) -c -o build/objects/src/cli/database.o src/cli/database.c

cliDatabaseHelp:
	$(CC) $(CFLAGS) -c -o build/objects/src/cli/databaseHelp.o src/cli/databaseHelp.c

lib: libCommon
	$(LD) $(LDFLAGS) -r -o build/objects/src/lib/mix.o build/objects/src/lib/common/mix.o

libCommon: libCommonFs libCommonChar
	$(LD) $(LDFLAGS) -r -o build/objects/src/lib/common/mix.o build/objects/src/lib/common/fs/mix.o build/objects/src/lib/common/char/mix.o
	$(CC) $(CFLAGS) -shared -o build/objects/src/lib/common/mix.so build/objects/src/lib/common/mix.o

libCommonChar: libCommonCharGetFormalUsername
	$(LD) $(LDFLAGS) -r -o build/objects/src/lib/common/char/mix.o build/objects/src/lib/common/char/getFormalUsername.o

libCommonCharGetFormalUsername:
	$(CC) $(CFLAGS) -c -o build/objects/src/lib/common/char/getFormalUsername.o src/lib/common/char/getFormalUsername.c

libCommonFs: libCommonFsDoesFileExist libCommonFsLockFile libCommonFsUnlockFile
	$(LD) $(LDFLAGS) -r -o build/objects/src/lib/common/fs/mix.o build/objects/src/lib/common/fs/doesFileExist.o build/objects/src/lib/common/fs/lockFile.o build/objects/src/lib/common/fs/unlockFile.o

libCommonFsDoesFileExist:
	$(CC) $(CFLAGS) -c -o build/objects/src/lib/common/fs/doesFileExist.o src/lib/common/fs/doesFileExist.c

libCommonFsLockFile:
	$(CC) $(CFLAGS) -c -o build/objects/src/lib/common/fs/lockFile.o src/lib/common/fs/lockFile.c

libCommonFsUnlockFile:
	$(CC) $(CFLAGS) -c -o build/objects/src/lib/common/fs/unlockFile.o src/lib/common/fs/unlockFile.c

tests: 0010-doesFileExist
	tests/0010-doesFileExist/elf

0010-doesFileExist: libCommonFsDoesFileExist
	$(CC) $(CFLAGS) -c -o build/objects/tests/0010-doesFileExist.o tests/0010-doesFileExist/index.c
	$(LD) $(LDFLAGS) -r -o tests/0010-doesFileExist/index.o build/objects/tests/0010-doesFileExist.o build/objects/src/lib/common/fs/doesFileExist.o
	$(CC) $(LDFLAGS) -o tests/0010-doesFileExist/elf tests/0010-doesFileExist/index.o

clean: cleanObjects cleanTests
	rm -f bins/nekomusume 

cleanTests:
	rm -f tests/0010-doesFileExist/elf tests/0010-doesFileExist/mix.o tests/0010-doesFileExist/mix tests/0010-doesFileExist/index.o

cleanObjects:
	rm -f build/objects/src/cli/main.o build/objects/src/lib/common/fs/doesFileExist.o build/objects/src/lib/common/fs/lockFile.o build/objects/src/lib/common/fs/unlockFile.o build/objects/src/cli/version.o build/objects/src/cli/help.o build/objects/src/cli/database.o
	rm -f build/objects/src/lib/common/fs/mix.o build/objects/src/lib/common/mix.o build/objects/src/lib/mix.o build/objects/src/cli/mix.o build/objects/src/mix.o build/objects/mix.o 
	rm -f build/objects/src/lib/common/char/getFormalUsername.o build/objects/src/lib/common/char/mix.o build/objects/src/lib/common/fs/mix.so build/objects/src/lib/common/mix.so
	rm -f build/objects/src/lib/common/fs/doesFileExist.o build/objects/tests/0010-doesFileExist.o 
