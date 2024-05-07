void display(List<dynamic> names) {
  int n = names.length;
  for (int i = 0; i < n - 1; i++) {
    int flag = 0;
    for (int j = 0; j < n - i - 1; j++) {
      if (names[j].compareTo(names[j + 1]) > 0) {
        var temp = names[j];
        names[j] = names[j + 1];
        names[j + 1] = temp;
        flag = 1;
      }
    }
    if (flag == 0) {
      break;
    }
  }
  //******************************* */  Time complexity...O(n²)!*************
  print(names);
}

void main() {
  List<dynamic> names = ['banana', 'Grapes', 'jackfruit', 'Apple'];
  // List<int> nums = [64, 34, 25, 12, 22, 11, 90];
  print('Unsorted list $names');
  print('Sorted list');
  display(names);
}
