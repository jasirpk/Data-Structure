// *************************Find index String position..!*************

// import 'dart:io';

// void main() {
//   String word = "Welcome to code editor controller";
//   var reverse = word.split('').reversed.join();
//   print(reverse);
//   print('Enter index : ');
//   var index = int.parse(stdin.readLineSync()!);
//   var str = word[index];
//   print('Character at index $str');
// }

// *****************************Find Secret message..!**********************
// class Sample {
//   static String display(String str, int key) {
//     String result = '';
//     for (int i = 0; i < str.length; i++) {
//       var charcode = str.codeUnitAt(i);
//       var newcode = (charcode + key) % 256;
//       result += String.fromCharCode(newcode);
//     }
//     return result;
//   }
// }

// void main() {
//   var value = 'hai';
//   print(Sample.display(value, 2));
// }

// **********************************Reversing String...!********************

String reverseString(String str) {
  if (str.isEmpty) {
    return str;
  }
  return reverseString(str.substring(1)) + str[0];
}

void main() {
  String original = "hello";
  String reversed = reverseString(original);
  print("Original String: $original");
  print("Reversed String: $reversed");
}
