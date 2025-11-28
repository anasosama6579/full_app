class AppRegex{

  static bool isValidEmail(String email) {
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(email);
  }

  static bool isValidPassword(String password) {
    final passwordRegex = RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*(),.?":{}|<>]).{8,}$');
    return passwordRegex.hasMatch(password);
  }

  static bool hasLowercase(String password) {
    return RegExp(r'[a-z]').hasMatch(password);
  }
  static bool hasUppercase(String password) {
    return RegExp(r'[A-Z]').hasMatch(password);
  }
  static bool hasNumber(String password) {
    return RegExp(r'\d').hasMatch(password);
  }
  static bool hasSpecialCharacter(String password) {
    return RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(password);
  }
  static bool hasMinLength(String password) {
      return RegExp(r'.{8,}').hasMatch(password);
  }
}