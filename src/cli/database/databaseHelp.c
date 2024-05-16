#include <stdint.h> // uint8_t
#include <stdio.h> // printf(3)

#include "../../../headers/src/cli/database/databaseHelp.h"

uint8_t cli_databaseHelp(void)
{
	printf("\t%s\n", "nekomusume database help\tList out database-related subcommands");
	printf("\n");
	printf("%s\n", "Thank you for trying out nekomusume ^w^");

	return 0;
}
