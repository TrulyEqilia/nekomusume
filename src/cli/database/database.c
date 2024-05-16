#include <stdint.h> // uint8_t
#include <string.h> // strcmp(3)

#include "../../../headers/src/cli/database/databaseHelp.h"

#include "../../../headers/src/cli/database/database.h"

uint8_t cli_database(int argc, char *argv[])
{
	if (argc < 3) {
		cli_databaseHelp();
		return 0;
	}

	if (strcmp(argv[2], "help") == 0) {
		cli_databaseHelp();
		return 0;
	}

	return 0;
}
