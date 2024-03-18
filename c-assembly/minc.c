#include <stdio.h>

#define ARRAY_SIZE(x)		(sizeof(x) / sizeof(x[0]))

// asm defined function
extern int asm_min(int *arr, int size);

int main()
{
	int min;
	int arr[] = {15, 14, 13, 12, 11, 10};

	min = asm_min(arr, ARRAY_SIZE(arr));

	printf("Minimum value: %d\n", min);

	return 0;
}
