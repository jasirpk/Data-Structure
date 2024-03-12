// *******************printing a Message One more Time..!*******************

// class Recursion {
//   void display(int n) {
//     if (n == 0) {
//       print('Stop the proccess');
//     } else {
//       print('welcome to Sampleof Recursion');
//       n--;
//       display(n);
//     }
//   }
// }

// void main() {
//   Recursion recursion = Recursion();
//   recursion.display(3);
// }

// *******************************Sum of list by using recursion...!*************************

int sum(List<int> arr, int index) {
  if (index == arr.length) {
    return 0;
  }
  return arr[index] + sum(arr, index + 1);
}

void main() {
  List<int> arr = [1, 2, 3, 4, 5, 6];
  int value = sum(arr, 0);
  print(value);
}
