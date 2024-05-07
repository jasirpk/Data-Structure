int partition(List<int> nums, int start, end) {
  int pivot = nums[end];
  int i = start - 1;

  for (int j = start; j < end; j++) {
    if (nums[j] < pivot) {
      i++;
      int temp = nums[i];
      nums[i] = nums[j];
      nums[j] = temp;
    }
  }

  int temp = nums[i + 1];
  nums[i + 1] = nums[end];
  nums[end] = temp;

  return i + 1;
}

void quicksort(List<int> nums, int start, int end) {
  if (start < end) {
    int pi = partition(nums, start, end);
    quicksort(nums, start, pi - 1);
    quicksort(nums, pi + 1, end);
  }
}

void main() {
  List<int> nums = [20, 23, 11, 40, 79, 96];
  int start = 0;
  int end = nums.length - 1;
  quicksort(nums, start, end);
  print(nums);
}
