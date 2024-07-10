class Calculator {
  late final Calculator calculator;

  Calculator({Calculator? calculator}) {
    this.calculator = calculator ?? this;
  }

  num calculate(List<num> arguments) {
    num firtOperend = arguments[0];
    num operation = arguments[1];
    num secondOperend = arguments[2];

    switch (operation) {
      case 1:
        calculator.add(firtOperend, secondOperend);
        break;
      case 2:
        calculator.subtract(firtOperend, secondOperend);
        break;

      case 3:
        calculator.multiply(firtOperend, secondOperend);
        break;
      case 4:
        calculator.divide(firtOperend, secondOperend);
        break;
      default:
        print("올바르지 않은 연산자 입니다.: $operation");
    }

    return 0;
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
}
