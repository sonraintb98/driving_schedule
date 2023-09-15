import 'dart:async';
import 'dart:convert';
import 'package:driving_schedule/blocs/login_bloc.dart';
import 'package:http/http.dart' as http;

class NetworkRequest {
  LoginBloc loginBloc = LoginBloc();
  Future<bool> checkLogin() async {
    try {
      var headers = {'content-type': 'application/json'};
      var url = Uri.parse(
          'https://driving-schedule-api.azurewebsites.net/api/auths/login');
      Map body = {
        'phonenumber': loginBloc.lastPasswordValue,
        'password': loginBloc.lastPasswordValue
      };
      http.Response response =
      await http.post(url, body: jsonEncode(body), headers: headers);

      if (response.statusCode == 200) {
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }
}
