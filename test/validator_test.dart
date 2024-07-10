import 'package:test/test.dart';

import 'package:cli/utils/validator.dart';

void main() {
  group('Validator validate:', () {
    test('정수 1 은 true 를 반환한다.', () {
      expect(
        Validator.validate('1'),
        true,
      );
    });

    test('실수 0.1 은 true 를 반환한다.', () {
      expect(
        Validator.validate('0.1'),
        true,
      );
    });

    test('실수 1.2 는 true 를 반환한다.', () {
      expect(
        Validator.validate('1.2'),
        true,
      );
    });

    test('실수 100.111 은 true 를 반환한다.', () {
      expect(
        Validator.validate('100.111'),
        true,
      );
    });

    test('연속된 소수점을 포함한 1..2 는 false 를 반환한다.', () {
      expect(
        Validator.validate('1..2'),
        false,
      );
    });

    test('연속된 소수점을 포함한 100..111 는 false 를 반환한다.', () {
      expect(
        Validator.validate('100..111'),
        false,
      );
    });

    test('알파벳 a 는 false 를 반환한다.', () {
      expect(
        Validator.validate('a'),
        false,
      );
    });

    test('한글 ㄱ 은 false 를 반환한다.', () {
      expect(
        Validator.validate('ㄱ'),
        false,
      );
    });
  });
}
