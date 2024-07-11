enum Operation {
  add(1),
  subtract(2),
  multiply(3),
  divide(4),
  undefined(-1);

  const Operation(this.value);
  final int value;

  factory Operation.getByValue(num value) {
    return Operation.values.firstWhere(
      (operation) => operation.value == value,
      orElse: () => Operation.undefined,
    );
  }
}
