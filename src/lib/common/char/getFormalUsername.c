#include <stdio.h>
#include <stdint.h>
#include <unistd.h>
#include <errno.h>
#include <ctype.h>

#include "../../../../headers/src/lib/common/char/getFormalUsername.h"

int8_t getFormalUsername(char *username)
{
	unsigned long int i = 0;
	if (sizeof(username) == 0) 
		return -1;

	getlogin_r(username, sizeof(username));
	
	if (errno != 0) {
		perror("src/lib/common/char/getFormalUsername.c getlogin_r: ");
		return errno;
	}

	i = 0;
	for (;i < sizeof(username); i++) {
		username[i] = tolower(username[i]);
	}

	username[0] = toupper(username[0]);

	return 0;
}
