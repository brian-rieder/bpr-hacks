#include <stdio.h>
#include <string.h>

void print_usage () {
  printf("Usage: \n"
    "  Default Mode: Translate from ASCII numeric values to characters.\n"
    "    e.g.,\n"
    "   ./executable 104 101 108 108 111 32 116 104 101 114 101 \n"
    "    output: \"hello there\"\n"
    "  With -c flag: Translate from characters to ASCII numeric values.\n"
    "    e.g.,\n"
    "    ./executable -c hello there\n"
    "    output: \"104 101 108 108 111 32 116 104 101 114 101\"\n"
  );
}

void main(int argc, char** argv) {
	if(argc == 1) {print_usage(); return;}
	int charToAscii = strcmp(argv[1], "-c") == 0 ? 1 : 0;
	int i, j;
	if(charToAscii)
		for(i = 2; i < argc; ++i) {
			for(j = 0; j < strlen(argv[i]); ++j)
				printf("%d ", argv[i][j]);
			if(argc > 3 && i < argc - 1)
				printf("%d ", ' ');
		}
	else
		for(i = 1; i < argc; ++i)
			printf("%c", atoi(argv[i]));
}
