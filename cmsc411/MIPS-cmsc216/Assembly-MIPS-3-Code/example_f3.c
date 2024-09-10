#include <stdio.h>

int f(int j);

int main() {
  printf("%d\n", f(4));
  return 0;
}

/* recursively compute 1*1 + ... + j*j */
int f(int j) {
  if (j == 1)
    return 1;
  else
    return j*j + f(j-1);
}
