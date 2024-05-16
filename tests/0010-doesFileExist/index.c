#include <stdio.h>

#include "../../headers/src/lib/common/fs/doesFileExist.h"

int main(void)
{
        int exitCode = 0;
        printf("%s\n", "Running 0010-doesFileExist tests");

        printf("%s", "test 1: ");
        if (doesFileExist("/proc/self/exe") != 1) {
                printf("%s\n", "!!! FAILED !!!");
                exitCode = exitCode + 1;
        } else {
                printf("%s\n", "success!");
        }

        printf("%s", "test 2: ");
        if (doesFileExist("/proc/self/fail") != 0) {
                printf("%s\n", "!!! FAILED !!!");
                exitCode = exitCode + 2;
        } else {
                printf("%s\n", "success!");
        }

        printf("%s", "test 3: ");
        if (doesFileExist("proc/self") != 0) {
                printf("%s\n", "!!! FAILED !!!");
                exitCode = exitCode + 4;
        } else {
                printf("%s\n", "success!");
        }

        return exitCode;
}
