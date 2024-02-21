#include <stdio.h>

/*****************************************************************************/
//
#define CONSTANT		20

// globals initialized
int global_x = 20;

// global uninitialized
int global_y;


/*****************************************************************************/

int my_sum_func(int x, int y)
{
	return x + y;
}


/*****************************************************************************/

int main()
{
	// declare variables
	int sum, z;

	// initialize variables
	z = 10;
	global_y = 20;

	// perform sum
	sum = my_sum_func(global_x, global_y) + z + CONSTANT;

	// print sum
	printf("sum = %d\n", sum);

	return 0;
}
