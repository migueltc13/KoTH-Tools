#include <stdio.h>

int main(int argc, char *argv[]) {
    // Check if there are arguments
    if (argc > 1) {
        // Loop through and print each argument
        for (int i = 1; i < argc; i++) {
            printf("%s", argv[i]);
            
            // Add a space after each argument except the last one
            if (i < argc - 1) {
                printf(" ");
            }
        }
        printf("\n");  // Add a newline at the end
    } else {
        printf("No arguments provided.\n");
    }

    return 0;
}
