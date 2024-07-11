enum Operation {
  add(1, 'Addition'),
  subtract(2, 'Subtraction'),
  multiply(3, 'Multiplication'),
  divide(4, 'Division'),
  undefined(-1, 'Undefined');

  const Operation(this.value, this.label);
  final int value;
  final String label;

  factory Operation.getValueFromArgument(String argument) {
    switch (argument) {
      case '+':
        return Operation.add;
      case '-':
        return Operation.subtract;
      case '*':
        return Operation.multiply;
      case '/':
        return Operation.divide;
      default:
        return Operation.undefined;
    }
  }
}
