import 'package:test/test.dart';

import 'package:calculator/util/validator_util.dart';

void main() {
  Validator validator = Validator();

  group('Validator validateOperand:', () {
    Validator validator = Validator();

    test('정수 1 은 true 를 반환한다.', () {
      expect(
        validator.validateOperand('1'),
        true,
      );
    });

    test('실수 0.1 은 true 를 반환한다.', () {
      expect(
        validator.validateOperand('0.1'),
        true,
      );
    });

    test('실수 1.2 는 true 를 반환한다.', () {
      expect(
        validator.validateOperand('1.2'),
        true,
      );
    });

    test('실수 100.111 은 true 를 반환한다.', () {
      expect(
        validator.validateOperand('100.111'),
        true,
      );
    });

    test('연속된 소수점을 포함한 1..2 문자열은 false 를 반환한다.', () {
      expect(
        validator.validateOperand('1..2'),
        false,
      );
    });

    test('연속된 소수점을 포함한 100..111 는 false 를 반환한다.', () {
      expect(
        validator.validateOperand('100..111'),
        false,
      );
    });

    test('알파벳 a 는 false 를 반환한다.', () {
      expect(
        validator.validateOperand('a'),
        false,
      );
    });

    test('한글 ㄱ 은 false 를 반환한다.', () {
      expect(
        validator.validateOperand('ㄱ'),
        false,
      );
    });

    test('a.1 는 false 를 반환한다.', () {
      expect(
        validator.validateOperand('a.1'),
        false,
      );
    });

    test('1.a 는 false 를 반환한다.', () {
      expect(
        validator.validateOperand('1.a'),
        false,
      );
    });
  });

  group('Validator validateOperation:', () {
    test('+ 를 인자로 전달하면 true 를 반환한다.', () {
      String argument = '+';

      expect(
        validator.validateOperation(argument),
        true,
      );
    });

    test('- 를 인자로 전달하면 true 를 반환한다.', () {
      String argument = '-';

      expect(
        validator.validateOperation(argument),
        true,
      );
    });

    test('* 를 인자로 전달하면 true 를 반환한다.', () {
      String argument = '*';

      expect(
        validator.validateOperation(argument),
        true,
      );
    });

    test('/ 를 인자로 전달하면 true 를 반환한다.', () {
      String argument = '/';

      expect(
        validator.validateOperation(argument),
        true,
      );
    });

    test('a 를 인자로 전달하면 false 를 반환한다.', () {
      String argument = 'a';

      expect(
        validator.validateOperation(argument),
        false,
      );
    });
  });

  group('Validator validateArguments:', () {
    test("['a', 'b', 'a'] 인자는 false 를 반환한다.", () {
      var arguments = ['a', 'b', 'a'];

      var result = validator.validateArguments(arguments);

      expect(result, false);
    });

    test("['1', '1', '1'] 인자는 false 를 반환한다.", () {
      var arguments = ['1', '1', '1'];

      var result = validator.validateArguments(arguments);

      expect(result, false);
    });

    test("['1.1', '1', '1.2'] 인자는 false 를 반환한다.", () {
      var arguments = ['1.1', '1', '1.2'];

      var result = validator.validateArguments(arguments);

      expect(result, false);
    });

    test("['1', '+', '1'] 인자는 true 를 반환한다.", () {
      var arguments = ['1', '+', '1'];

      var result = validator.validateArguments(arguments);

      expect(result, true);
    });

    test("['1', '-', '1'] 인자는 true 를 반환한다.", () {
      var arguments = ['1', '-', '1'];

      var result = validator.validateArguments(arguments);

      expect(result, true);
    });

    test("['1', '*', '1'] 인자는 true 를 반환한다.", () {
      var arguments = ['1', '*', '1'];

      var result = validator.validateArguments(arguments);

      expect(result, true);
    });

    test("['1', '/', '1'] 인자는 true 를 반환한다.", () {
      var arguments = ['1', '/', '1'];

      var result = validator.validateArguments(arguments);

      expect(result, true);
    });
  });
}
