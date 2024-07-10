import 'dart:io';

void main() {
  String? name = stdin.readLineSync();

  if (name != null) {
    print('Hello, $name!');
  } else {
    print('Hello, stranger!');
  }
}
