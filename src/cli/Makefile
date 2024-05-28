cli: cliMain cliHelp cliDatabase
	$(LD) $(LDFLAGS) -r -o build/objects/src/cli/mix.o build/objects/src/cli/main.o build/objects/src/cli/help.o build/objects/src/cli/database/mix.o

cliMain:
	$(CC) $(CFLAGS) -c -o build/objects/src/cli/main.o src/cli/main.c

cliHelp:
	$(CC) $(CFLAGS) -c -o build/objects/src/cli/help.o src/cli/help.c

cleanCli: cleanCliDatabase
	rm -f build/objects/src/cli/mix.o
	rm -f build/objects/src/cli/main.o
	rm -f build/objects/src/cli/help.o

include ./src/cli/database/Makefile
