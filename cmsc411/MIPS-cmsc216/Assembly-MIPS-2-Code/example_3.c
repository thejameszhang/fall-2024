/* example3.c */

#include <stdio.h>

int n;

int main() {
  printf("Enter int n: ");
  scanf("%d", &n);
  if (n % 2)
    printf("n is odd\n");
  else
    printf("n is even\n");
  return 0;
}
