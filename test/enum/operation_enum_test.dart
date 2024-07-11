import 'package:test/test.dart';

import 'package:calculator/enum/operation_enum.dart';

void main() {
  group('Operation getValueFromArgument:', () {
    test('인자에 맞는 Operation 값을 반환할 수 있다.', () {
      expect(Operation.getValueFromArgument('+'), equals(Operation.add));
      expect(Operation.getValueFromArgument('-'), equals(Operation.subtract));
      expect(Operation.getValueFromArgument('*'), equals(Operation.multiply));
      expect(Operation.getValueFromArgument('/'), equals(Operation.divide));
      expect(Operation.getValueFromArgument('%'), equals(Operation.undefined));
    });
  });
}
