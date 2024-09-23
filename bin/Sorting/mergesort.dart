void main() {
  List<int> nums = [2, 5, 1, 3, 5, 6, 7, 4];
  print(mergeSort(nums));
}

List<int> mergeSort(List<int> numbers) {
  // Base case: if the list has 1 or fewer elements, it is already sorted
  if (numbers.length <= 1) {
    return numbers;
  }

  // Split the list into two halves
  int middle = numbers.length ~/ 2;
  List<int> left = numbers.sublist(0, middle);
  List<int> right = numbers.sublist(middle);

  // Recursively sort both halves
  left = mergeSort(left);
  right = mergeSort(right);

  // Merge the two sorted halves
  return merge(left, right);
}

// Function to merge two sorted lists
List<int> merge(List<int> left, List<int> right) {
  List<int> result = [];
  int i = 0, j = 0;

  // Compare elements from both lists and add the smaller one to the result
  while (i < left.length && j < right.length) {
    if (left[i] <= right[j]) {
      result.add(left[i]);
      i++;
    } else {
      result.add(right[j]);
      j++;
    }
  }

  // If there are remaining elements in left or right, add them to the result
  while (i < left.length) {
    result.add(left[i]);
    i++;
  }
  while (j < right.length) {
    result.add(right[j]);
    j++;
  }

  return result;
}
