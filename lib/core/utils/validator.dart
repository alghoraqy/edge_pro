
class Validator {
  static String? requiredFieldValidator(String? field) {
    if (field!.trim().isEmpty) return 'This field is required';
    return null;
  }

}
