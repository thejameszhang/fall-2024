/* Local vars, args, rval */

#include <stdio.h>

int f(int a, int b);

int main(void) {
  int x, y;
  x =  5;
  y =  7;
  printf("%d\n", f(x, y));
  return 0;
}

int f(int a, int b) {
  int z;
  z =  10;
  return z + a + b;
}
