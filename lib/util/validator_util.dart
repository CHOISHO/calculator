import 'package:cli/enum/operation_enum.dart';

class Validator {
  bool validateArguments(List<String> arguments) {
    bool isValid = true;

    for (int i = 0; i < arguments.length; i++) {
      dynamic argument = arguments[i];
      bool isOperationArgument = i % 2 == 1;

      if (isOperationArgument && validateOperation(argument) == false) {
        isValid = false;
        break;
      } else if (validateOperand(argument) == false) {
        isValid = false;
        break;
      }
    }

    return isValid;
  }

  bool validateOperand(String value) {
    String stringValue = value.toString();
    RegExp exp = RegExp(r'^[0-9]+(\.[0-9]+)?$');

    return exp.hasMatch(stringValue);
  }

  bool validateOperation(String value) {
    bool isValid = false;

    for (var operation in Operation.values) {
      if (operation.value == num.parse(value)) {
        isValid = true;
        break;
      }
    }

    return isValid;
  }
}
