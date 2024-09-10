/* example_4.c */
/* Print 1*1 + 2*2 + ... + 20*20 */

#include <stdio.h>

int n = 20, i = 1, sum = 0;

int main() {
  while (i <= n) {
    sum += i * i;
    i++;
  }
  printf("sum: %d\n", sum);
  return 0;
}
