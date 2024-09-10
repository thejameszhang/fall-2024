/* No args, no rval, no local vars */

#include <stdio.h>

void f(void);
void g(void);

int main(void) {
  f();
  return 0;
}

void f(void) {
  printf("in f\n");
  g();
}

void g(void) {
  printf("in g\n");
}
