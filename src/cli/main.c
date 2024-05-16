#include <stdlib.h> // abort(3)
#include <stdio.h> // printf(3)
#include <string.h> // strcmp(3)

#include "../../headers/src/cli/database/database.h"
#include "../../headers/src/cli/index.h"

#include "../../headers/src/cli/help.h"

int main(int argc, char *argv[])
{
	if (argc == 0) abort();

	if (argc < 2) {
		printf("%s\n", "Oopsie, you didn't select anything!");
		printf("%s\n", "Your potential option is to run help, although I won't assume anything.");
		printf("%s \"%s %s\".\n", "You can access it running", argv[0], "help");
		
		return 0;
	}

	if (strcmp(argv[1], "help") == 0) {
		cli_help();
		return 0;
	}

	if (strcmp(argv[1], "database") == 0) {
		cli_database(argc, argv);
		return 0;
	}

	printf("%s\n", "Hi, it looks like you made an invalid selection!");
	printf("%s\n\n", "I'll redirect you to the help page, don't you worry!");

	cli_help();
	return 0;
}
