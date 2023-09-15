import 'dart:async';

import 'package:driving_schedule/validations/validations.dart';

class LoginBloc {
  final StreamController<String> _errorPhoneNumberController = StreamController();
  final StreamController<String> _errorPasswordController = StreamController();

  Stream<String> get errorPhoneNumberStream => _errorPhoneNumberController.stream;
  Stream<String> get errorPasswordStream => _errorPasswordController.stream;

  StreamController<String> phoneNumberStream = StreamController<String>.broadcast();
  StreamController<String> passwordStream = StreamController<String>.broadcast();

  String lastPhoneNumberValue = '';
  String lastPasswordValue = '';

  static final LoginBloc _singleton = LoginBloc._internal();

  factory LoginBloc() {
    return _singleton;
  }

  LoginBloc._internal();

  bool isValidateInfo(String phoneNumber, String password) {
    if (!Validations.isValidPhoneNumber(phoneNumber)) {
      _errorPhoneNumberController.sink.addError("Số điện thoại không hợp lệ!");
      return false;
    }
    if (!Validations.isPassword(password)) {
      _errorPasswordController.sink.addError("Mật khẩu không hợp lệ!");
      return false;
    }
    return true;
  }

  void listenToStreams() {
    phoneNumberStream.stream.listen((String phoneNumber) {
      lastPhoneNumberValue = phoneNumber;
    });

    passwordStream.stream.listen((String password) {
      lastPasswordValue = password;
    });
  }

  void dispose() {
    _errorPhoneNumberController.close();
    _errorPasswordController.close();
    phoneNumberStream.close();
    passwordStream.close();
  }
}
