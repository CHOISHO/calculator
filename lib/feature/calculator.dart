import 'package:calculator/enum/operation_enum.dart';
import 'package:calculator/util/validator_util.dart';

abstract class Operation {
  num execute(num a, num b);
}

class AddOperation implements Operation {
  @override
  num execute(num a, num b) => a + b;
}

class SubtractOperation implements Operation {
  @override
  num execute(num a, num b) => a - b;
}

class MultiplyOperation implements Operation {
  @override
  num execute(num a, num b) => a * b;
}

class DivideOperation implements Operation {
  @override
  num execute(num a, num b) => a / b;
}

class OperationFactory {
  static Operation getOperation(OperationEnum operation) {
    switch (operation) {
      case OperationEnum.add:
        return AddOperation();
      case OperationEnum.subtract:
        return SubtractOperation();
      case OperationEnum.multiply:
        return MultiplyOperation();
      case OperationEnum.divide:
        return DivideOperation();
      default:
        throw Exception('Invalid operation');
    }
  }
}

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
    OperationEnum parsedOperation =
        OperationEnum.getByValue(parsedArguments[1]);
    num secondOperand = parsedArguments[2];

    Operation operation = OperationFactory.getOperation(parsedOperation);
    num result = operation.execute(firstOperand, secondOperand);

    return '${parsedOperation.label}($firstOperand, $secondOperand) result: $result';
  }
}
