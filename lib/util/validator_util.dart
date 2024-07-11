import 'package:calculator/enum/operation_enum.dart';

class Validator {
  bool validateArguments(List<String> arguments) {
    bool isValid = true;

    for (int i = 0; i < arguments.length; i++) {
      String argument = arguments[i];
      bool isOperationArgument = i % 2 == 1;

      if (isOperationArgument && validateOperation(argument) == false) {
        isValid = false;
        break;
      } else if (!isOperationArgument && validateOperand(argument) == false) {
        isValid = false;
        break;
      }
    }

    return isValid;
  }

  bool validateOperand(String argument) {
    String stringValue = argument.toString();
    RegExp exp = RegExp(r'^[0-9]+(\.[0-9]+)?$');

    return exp.hasMatch(stringValue);
  }

  bool validateOperation(String argument) {
    Operation operation = Operation.getValueFromArgument(argument);

    return operation == Operation.undefined ? false : true;
  }
}
