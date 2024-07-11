enum Operation {
  add(1, 'Addition'),
  subtract(2, 'Subtraction'),
  multiply(3, 'Multiplication'),
  divide(4, 'Division'),
  undefined(-1, 'Undefined');

  const Operation(this.value, this.label);
  final int value;
  final String label;

  factory Operation.getByValue(num value) {
    return Operation.values.firstWhere(
      (operation) => operation.value == value,
      orElse: () => Operation.undefined,
    );
  }
}
