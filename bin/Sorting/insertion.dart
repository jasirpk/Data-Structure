void display(List<int> nums) {
  int n = nums.length;
  int key;
  for (int i = 1; i < n; i++) {
    key = nums[i];
    int j = i - 1;
    while (j >= 0 && nums[j] > key) {
      nums[j + 1] = nums[j];
      j--;
    }
    nums[j + 1] = key;

    //********************************/  Time complexity...O(n²)!*************
  }
  print(nums);
}

void main() {
  List<int> nums = [64, 34, 25, 12, 22, 11, 90];
  print('Unsorted list $nums');
  print('Sorted list');
  display(nums);
}
