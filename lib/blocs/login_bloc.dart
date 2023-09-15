import 'dart:async';

import 'package:driving_schedule/validations/validations.dart';

class LoginBloc {
  StreamController _phonenumberController = new StreamController.broadcast();
  StreamController _passwordController = new StreamController.broadcast();

  static final LoginBloc _singleton = LoginBloc._internal();

  factory LoginBloc() {
    return _singleton;
  }

  LoginBloc._internal();

  Stream get phonenumberStream => _phonenumberController.stream;
  Stream get passwordStream => _passwordController.stream;

  bool isValidateInfo(String phonenumber, String password) {
    if (!Validations.isValidPhonenumber(phonenumber)) {
      _phonenumberController.sink.addError("Số điện thoại không hợp lệ!");
      return false;
    }
    if (!Validations.isPassword(password)) {
      _passwordController.sink.addError("Mật khẩu không hợp lệ!");
      return false;
    }
    return true;
  }

  void dispose() {
    _phonenumberController.close();
    _passwordController.close();
  }
}
