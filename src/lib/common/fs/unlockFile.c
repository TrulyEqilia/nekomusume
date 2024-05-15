#include <sys/file.h> /* flock(2) */
#include <stdint.h> /* uint8_t */
#include <errno.h> /* errno */

#include "../../../../headers/src/lib/common/fs/unlockFile.h"

uint8_t unlockFile(int fd)
{
	int flockResult;

	flockResult = flock(fd, LOCK_UN);

	if (errno != 0 && flockResult != 0) {
		return 0;
	}

	return 1;
}
