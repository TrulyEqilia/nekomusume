#include <stdio.h> // printf
#include <string.h> // strcmp(3)
#include <errno.h> // errno
#include <stdint.h> // uint8_t
#include <stdlib.h>

#include "../../headers/src/lib/common/char/getFormalUsername.h"

#include "../../headers/version.h"

#include "../../headers/src/cli/help.h"

uint8_t cli_help(void)
{
	char *username;

	username = malloc(256);

	if (errno != 0) {
		perror("cli/version.c malloc: ");
		printf("%s\n", strerror(errno));
		abort();
	}

	getFormalUsername(username);
	
	if (errno != 0) {
		perror("cli/version.c getlogin_r: ");
		printf("%s\n", strerror(errno));
		abort();
	}

	printf("%s%s%s%s\n", "Hi ", username, ", I'm nekomusume, version ", chVersion);
	printf("%s\n", "I have the following commands built in:");

	printf("\t%s\n", "nekomusume help\t\tList out all commands");
	printf("\t%s\n", "nekomusume database\tManage the internal database");
	printf("\n");

	printf("%s%s%s\n", "Thank you for trying out nekomusume, ", username, " ^w^");
	return 0;
}
