#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/types.h>
#include <sys/xattr.h>

int main(int argc, char *argv[]) {
    if (argc != 2) {
        fprintf(stderr, "Usage: %s <filename>\n", argv[0]);
        return 1;
    }

    const char *filename = argv[1];
    ssize_t attr_size;
    char *attr_list;

    // Get the size of the extended attribute list
    attr_size = listxattr(filename, NULL, 0);

    if (attr_size == -1) {
        perror("listxattr");
        return 1;
    }

    if (attr_size == 0) {
        printf("No extended attributes found for %s\n", filename);
        return 0;
    }

    // Allocate memory to store the attribute names
    attr_list = (char *)malloc(attr_size);

    if (attr_list == NULL) {
        perror("malloc");
        return 1;
    }

    // Get the extended attribute list
    attr_size = listxattr(filename, attr_list, attr_size);

    if (attr_size == -1) {
        perror("listxattr");
        free(attr_list);
        return 1;
    }

    // Print the extended attribute names
    printf("Extended attributes for %s:\n", filename);

    char *attr_name = attr_list;
    while (attr_name < attr_list + attr_size) {
        printf("%s\n", attr_name);
        attr_name += strlen(attr_name) + 1;
    }

    free(attr_list);
    return 0;
}
