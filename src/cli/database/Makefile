cliDatabase: cliDatabaseMain cliDatabaseHelp
	$(LD) $(LDFLAGS) -r -o build/objects/src/cli/database/mix.o build/objects/src/cli/database/main.o build/objects/src/cli/database/databaseHelp.o

cliDatabaseMain:
	$(CC) $(CFLAGS) -c -o build/objects/src/cli/database/main.o src/cli/database/database.c

cliDatabaseHelp:
	$(CC) $(CFLAGS) -c -o build/objects/src/cli/database/databaseHelp.o src/cli/database/databaseHelp.c

cleanCliDatabase:
	rm -f build/objects/src/cli/database/mix.o
	rm -f build/objects/src/cli/database/main.o
	rm -f build/objects/src/cli/database/databaseHelp.o
