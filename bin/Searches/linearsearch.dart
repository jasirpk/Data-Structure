// **********************Integer type linear Search..!*************

class Sample {
  void display(List<int> nums, int target) {
    for (int i = 0; i < nums.length; i++) {
      if (nums[i] == target) {
        print('target found position at $i');
      }
    }
  }
}

void main() {
  Sample sample = Sample();
  List<int> nums = [4, 5, 3, 9, 0, 1];
  int target = 0;
  sample.display(nums, target);
}


// ****************String type linear Search..!*****************


// class Sample {
//   void display(List<String> names, String target) {
//     for (var i = 0; i < names.length; i++) {
//       if (names[i] == target) {
//         print('target found position at $i');
//       }
//     }
//   }
// }

// void main() {
//   Sample sample = Sample();
//   List<String> names = ['Apple', 'Banana', 'Grapes', 'Orange'];
//   String target = 'Orange';
//   sample.display(names, target);
// }
