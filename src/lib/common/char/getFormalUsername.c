#include <stdint.h> // uint8_t
#include <errno.h> // errno
#include <stdio.h> // perror(3)
#include <unistd.h> // getlogin_r(3)
#include <ctype.h> // toupper(3), tolower(3)

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
