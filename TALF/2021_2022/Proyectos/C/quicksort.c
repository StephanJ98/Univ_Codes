#include <string.h>
#include <stdio.h>
#include <stdlib.h>

void quickSortMain(char *items, int count);
void quickSort(char *items, int left, int right);

int main(void)
{
  char s[255]="asdfasdfasdfasdfasdfasdfasdf";

  quickSortMain(s, strlen(s));
  printf("The sorted string is: %s.\n", s);

  return 0;
}

void quickSortMain(char *items, int count)
{
  quickSort(items, 0, count-1);
}

void quickSort(char *items, int left, int right)
{
  int i, j;
  char x, y;

  i = left;
  j = right;
  x = items[(left+right)/2];

  do {
    while((items[i] < x) && (i < right))
       i++;
    while((x < items[j]) && (j > left))
       j--;

    if(i <= j) {
      y = items[i];
      items[i] = items[j];
      items[j] = y;
      i++; j--;
    }
  } while(i <= j);

  if(i < right)
      quickSort(items, i, right);
  if(left < j)
      quickSort(items, left, j);

}
