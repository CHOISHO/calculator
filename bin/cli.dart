import 'dart:io';

void main() {
  print('Enter the formula:');
  String? name = stdin.readLineSync();

  if (name != null) {
    print('Hello, $name!');
  } else {
    print('Hello, stranger!');
  }
}
