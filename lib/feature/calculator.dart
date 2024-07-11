import 'package:calculator/enum/operation_enum.dart';
import 'package:calculator/util/validator_util.dart';

class Calculator {
  late final Calculator calculator;

  Calculator({Calculator? calculator}) {
    this.calculator = calculator ?? this;
  }

  String calculate(List<String> arguments) {
    Validator validator = Validator();

    if (validator.validateArguments(arguments) == false) {
      throw '인자의 형식이 올바르지 않습니다.';
    }

    List<num> parsedArguments = arguments.map((e) => num.parse(e)).toList();

    num firstOperand = parsedArguments[0];
    Operation operation = Operation.getByValue(parsedArguments[1]);
    num secondOperand = parsedArguments[2];

    print(
        'firstOperand: $firstOperand, operation: $operation, secondOperand: $secondOperand');

    num? result;

    switch (operation) {
      case Operation.add:
        result = calculator.add(firstOperand, secondOperand);
        break;
      case Operation.subtract:
        result = calculator.subtract(firstOperand, secondOperand);
        break;
      case Operation.multiply:
        result = calculator.multiply(firstOperand, secondOperand);
        break;
      case Operation.divide:
        result = calculator.divide(firstOperand, secondOperand);
        break;
      default:
        throw "올바르지 않은 연산자 입니다.: $operation";
    }

    return '${operation.label}($firstOperand, $secondOperand) result: $result';
  }

  num add(a, b) {
    return a + b;
  }

  num subtract(a, b) {
    return a - b;
  }

  num multiply(a, b) {
    return a * b;
  }

  num divide(a, b) {
    return a / b;
  }

  /* TODO:
  - Trigonometric functions
  - Calculus
  - logarithmic function
  */
}
