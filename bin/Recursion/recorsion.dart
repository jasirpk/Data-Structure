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

// int sum(List<int> arr, int index) {
//   if (index == arr.length) {
//     return 0;
//   }
//   return arr[index] + sum(arr, index + 1);
// }

// void main() {
//   List<int> arr = [1, 2, 3, 4, 5, 6];
//   int value = sum(arr, 0);
//   print(value);
// }

// find odd and even using single number...!

// int findOdd(int n) {
//   if (n == 0) {
//     return 0;
//   }
//   if (n % 2 == 0) {
//     print('even num beres $n');
//   } else {
//     print('odd num is $n');
//   }
//   return findOdd(n - 1);
// }

// void main() {
//   findOdd(8);
// }

// palindrom recursion...!

// bool palindrome(String text) {
//   text = text.toLowerCase();
//   if (text.length <= 1) {
//     return true;
//   }
//   if (text[0] != text[text.length - 1]) {
//     return false;
//   }
//   return palindrome(text.substring(1, text.length - 1));
// }

// void main() {
//   String text = 'Malayalam';
//   print(palindrome(text));
// }

// **********************************Reversing String...!********************

// String reverseString(String str) {
//   if (str.isEmpty) {
//     return str;
//   }
//   return reverseString(str.substring(1)) + str[0];
// }

// void main() {
//   String original = "hello";
//   String reversed = reverseString(original);
//   print("Original String: $original");
//   print("Reversed String: $reversed");
// }

int display(int n) {
  if (n == 10) {
    return 0;
  }

  print(n);

  return display(n + 1);
}

void main() {
  display(5);
}
