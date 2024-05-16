#include <stdio.h>
#include <stdint.h>

#include "../../../headers/src/cli/database/databaseHelp.h"

uint8_t cli_databaseHelp(void)
{
	printf("\t%s\n", "nekomusume database help\tList out database-related subcommands");
	printf("\n");
	return 0;
}
