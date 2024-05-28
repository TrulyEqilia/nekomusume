libCommonFs: libCommonFsDoesFileExist libCommonFsLockFile libCommonFsUnlockFile
	$(LD) $(LDFLAGS) -r -o build/objects/src/lib/common/fs/mix.o build/objects/src/lib/common/fs/doesFileExist.o build/objects/src/lib/common/fs/lockFile.o build/objects/src/lib/common/fs/unlockFile.o

libCommonFsDoesFileExist:
	$(CC) $(CFLAGS) -c -o build/objects/src/lib/common/fs/doesFileExist.o src/lib/common/fs/doesFileExist.c

libCommonFsLockFile:
	$(CC) $(CFLAGS) -c -o build/objects/src/lib/common/fs/lockFile.o src/lib/common/fs/lockFile.c

libCommonFsUnlockFile:
	$(CC) $(CFLAGS) -c -o build/objects/src/lib/common/fs/unlockFile.o src/lib/common/fs/unlockFile.c

cleanLibCommonFs:
	rm -f build/objects/src/lib/common/fs/doesFileExist.o
	rm -f build/objects/src/lib/common/fs/lockFile.o
	rm -f build/objects/src/lib/common/fs/unlockFile.o
