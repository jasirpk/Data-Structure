void display(List<int> nums) {
  int n = nums.length;
  for (int i = 0; i < n; i++) {
    int minvalue = i;
    for (int j = i + 1; j < n; j++) {
      if (nums[j] < nums[minvalue]) {
        minvalue = j;
      }
    }
    if (minvalue != i) {
      int temp = nums[minvalue];
      nums[minvalue] = nums[i];
      nums[i] = temp;
    }
  }
  print(nums);
}

void main() {
  List<int> nums = [64, 34, 25, 12, 22, 11, 90];
  print('Unsorted list $nums');
  print('Sorted list');
  display(nums);
}
