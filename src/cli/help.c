#include <stdint.h> // uint8_t
#include <stdlib.h> // malloc(3), abort(3), free(3)
#include <errno.h> // errno
#include <stdio.h> // perror(3), printf(3)
#include <string.h> // strerror(3), strcmp(3)

#include "../../headers/version.h"

#include "../../headers/src/cli/help.h"

uint8_t cli_help(void)
{
	printf("%s%s\n", "Hi, I'm nekomusume, version ", chVersion);
	printf("%s\n", "I have the following commands built in:");

	printf("\t%s\n", "nekomusume help\t\tList out all commands");
	printf("\t%s\n", "nekomusume database\tManage the internal database");
	printf("\n");

	printf("%s%s%s\n", "Thank you for trying out nekomusume ^w^");
	return 0;
}
