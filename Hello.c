#include <stdio.h>

int main() {
  FILE *fp = fopen("hello.txt", "w");
  fprintf(fp, "Hello world!\n");
  fclose(fp);

  return 0;
}