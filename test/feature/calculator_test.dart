import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'package:cli/feature/calculator.dart';

@GenerateNiceMocks([MockSpec<Calculator>()])
import 'calculator_test.mocks.dart';

void main() {
  group('Calculator calculate:', () {
    test("1 연산자가 전달되면 add 메소드가 호출된다.", () {
      var mockCalculator = MockCalculator();
      var calculator = Calculator(calculator: mockCalculator);

      calculator.calculate(['1', '1', '1']);

      verify(mockCalculator.add(1, 1)).called(1);
    });

    test("2 연산자가 전달되면 subtract 메소드가 호출된다.", () {
      var mockCalculator = MockCalculator();
      var calculator = Calculator(calculator: mockCalculator);

      calculator.calculate(['1', '2', '1']);

      verify(mockCalculator.subtract(1, 1)).called(1);
    });

    test("3 연산자가 전달되면 multiply 메소드가 호출된다.", () {
      var mockCalculator = MockCalculator();
      var calculator = Calculator(calculator: mockCalculator);

      calculator.calculate(['1', '3', '1']);

      verify(mockCalculator.multiply(1, 1)).called(1);
    });

    test("4 연산자가 전달되면 divide 메소드가 호출된다.", () {
      var mockCalculator = MockCalculator();
      var calculator = Calculator(calculator: mockCalculator);

      calculator.calculate(['1', '4', '1']);

      verify(mockCalculator.divide(1, 1)).called(1);
    });
  });
}
