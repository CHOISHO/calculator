import 'package:calculator/feature/calculator.dart';

void main(List<String> arguments) {
  try {
    if (arguments.isNotEmpty) {
      Calculator calculator = Calculator();

      String result = calculator.calculate(arguments);

      print(result);
    } else {
      throw '전달 받은 인자가 없습니다.';
    }
  } catch (e) {
    print(e);
  }
}
