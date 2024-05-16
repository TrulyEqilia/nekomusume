#include <stdint.h> // uint8_t

#include "../../../headers/src/cli/database/databaseHelp.h"

#include "../../../headers/src/cli/database/database.h"

uint8_t cli_database(int argc, char *argv[])
{
	if (argc < 3) {
		cli_databaseHelp();
		return 0;
	}
	
	return 0;
}
