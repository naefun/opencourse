class FormValidation {
  static final RegExp _emailValid = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  static final RegExp _passValid = RegExp(
      r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#\$%^&*(),.?":{}|<>])(?=.{8,20}).*$');

  static String? validateFieldNotEmpty(String? value, String message) {
    if (value == null || value.isEmpty) {
      return message;
    }
    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return "Please enter your email.";
    } else if (!_emailValid.hasMatch(value)) {
      return "Please enter a valid email.";
    }
    return null;
  }

  static String? validateRegistrationPassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Please enter a password.";
    } else if (!_passValid.hasMatch(value)) {
      return "Please enter a password which meets the following requirements:\n\n1 or more uppercase letters.\n1 or more lowercase letters.\n1 or more digits.\n1 or more symbols.\n8 to 20 characters.";
    }
    return null;
  }

  static String? validateRegistrationEmail(String? value) {
    if (value == null || value.isEmpty) {
      return "Please enter your email.";
    } else if (!_emailValid.hasMatch(value)) {
      return "Please enter a valid email.";
    }
    return null;
  }
}
