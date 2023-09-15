class Validations {
  static bool isValidPhoneNumber(String user) {
    return user.length > 6;
  }

  static bool isPassword(String pass) {
    return pass.length > 6;
  }
}
