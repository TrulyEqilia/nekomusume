#include <stdint.h> // uint8_t
#include <unistd.h> // access(3)

#include "../../../../headers/src/lib/common/fs/doesFileExist.h"

uint8_t doesFileExist(char *fname)
{
        /*
         * Please DO NOT try to optimise this by
         * removing "== 0" and swapping the options.
         * It will cause to UNCONDITIONALLY return
         * that the file exists, even though it isn't
         * always the case.
         *
         * (If it was the case, then
         * this function wouldn't have been needed in
         * the first place...)
         */
        if (access(fname, F_OK) == 0) return 1;

        return 0;
}

