enum OperationEnum {
  add(1, 'Addition'),
  subtract(2, 'Subtraction'),
  multiply(3, 'Multiplication'),
  divide(4, 'Division'),
  undefined(-1, 'Undefined');

  const OperationEnum(this.value, this.label);
  final int value;
  final String label;

  factory OperationEnum.getByValue(num value) {
    return OperationEnum.values.firstWhere(
      (operation) => operation.value == value,
      orElse: () => OperationEnum.undefined,
    );
  }
}
