class Validator {
  static bool validate(String value) {
    RegExp exp = RegExp(r'^[0-9]+(\.[0-9]+)?$');

    return exp.hasMatch(value);
  }
}
