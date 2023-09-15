class Validations {
  static bool isValidPhonenumber(String user) {
    return user != null && user.length > 6;
  }

  static bool isPassword(String pass) {
    return pass != null && pass.length > 6;
  }
}
