// ************************Binary Search Interger...!***********************

// class Sample {
//   void display(List<int> nums, int left, int right, int target) {
//     nums.sort();
//     print('Sorted list $nums');
//     while (left <= right) {
//       var middle = (left + right) ~/ 2;
//       if (nums[middle] == target) {
//         print('Target found position at $middle');
//         break;
//       } else if (nums[middle] > target) {
//         right = middle - 1;
//       } else {
//         left = middle + 1;
//       }
//     }
//   }
// }

// main() {
//   Sample sample = Sample();
//   List<int> nums = [1, 4, 2, 5, 3, 6, 7, 8];
//   int target = 6;
//   int left = 0;
//   int right = nums.length;
//   sample.display(nums, left, right, target);
// }

// **************************Binary Search String...!****************

class Sample {
  void display(List<String> names, String target, int left, int right) {
    names.sort();
    print('Sorted list $names');
    while (left <= right) {
      var middle = (left + right) ~/ 2;
      if (names[middle] == target) {
        print('Target found position at $middle');
        break;
      } else if (names[middle].compareTo(target) > 0) {
        right = middle - 1;
      } else {
        left = middle + 1;
      }
    }
  }
}

void main() {
  Sample sample = Sample();
  List<String> names = ['Apple', 'Banana', 'Grapes', 'Orange'];
  String target = 'Orange';
  int left = 0;
  int right = names.length;
  sample.display(names, target, left, right);
}
