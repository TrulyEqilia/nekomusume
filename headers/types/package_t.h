#include "checksum_t.h"
#include "constants.h"

struct package_t {
	struct checksum_t compressedTarballChecksum;
	struct checksum_t uncompressedTarballChecksum;
	char *name;
	char *version;
	char *description;
	char *dependencies;
	char *buildDependencies;
};
