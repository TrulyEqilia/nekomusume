#include "constants.h"

struct checksum_t {
	char algorithm[MAX_ALGORITHM_TYPE_LENGTH];
	char checksum[MAX_CHECKSUM_LENGTH];
};
