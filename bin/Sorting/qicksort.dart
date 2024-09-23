void main() {
  // List<num> nums = [2.2, 3.1, 5, 7.4, 9, 1];
  List<int> nums = [2, 5, 1, 3, 5, 6, 7, 4];
  print(quickSort(nums));
}

List<int> quickSort(List<int> numbers) {
  if (numbers.length <= 1) {
    return numbers;
  }
  int pivot = numbers[numbers.length ~/ 2];

  List<int> left = [];
  List<int> right = [];

  for (int i = 0; i < numbers.length; i++) {
    if (i == numbers.length ~/ 2) continue;
    if (numbers[i] > pivot) {
      left.add(numbers[i]);
    } else {
      right.add(numbers[i]);
    }
  }
  return [...quickSort(left), pivot, ...quickSort(right)];
}
