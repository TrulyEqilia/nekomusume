#include <sys/file.h> /* flock(2) */
#include <stdint.h> /* uint8_t */
#include <errno.h> /* errno */

#include "../../../../headers/src/lib/common/fs/lockFile.h"

uint8_t lockFile(int fd)
{
	int flockResult;

	flockResult = flock(fd, LOCK_EX);

	if (errno != 0 && flockResult != 0) {
		return 0;
	}

	return 1;
}
