#include <unistd.h>
#include <stdint.h>

#include "../../../../headers/src/lib/common/fs/doesFileExist.h"

uint8_t doesFileExist(char *fname)
{
        if (access(fname, F_OK) == 0) return 1;

        return 0;
}

