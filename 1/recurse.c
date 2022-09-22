#include <stdio.h>

void print_array(int nums[], int len, int i) {
	if (len == 0) return;
	print_array(nums, len - 1, i);
	printf("%d\n", nums[len - 1]);

	// print_array(nums, len, i + 1);
}

int main() {
	int nums[] = {0, 1, 2, 3, 4, 3, 2, 1};
	print_array(nums, 8, 0);
}
