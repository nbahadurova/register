import 'dart:developer';
import 'package:register/utils/constants/endpoints.dart';
import 'package:register/data/models/remote/register_model.dart';
import 'package:register/utils/network/dio/auth_dio/auth_dio.dart';

class RegisterService {
  Future<RegisterResponse> register(
    String email,
    String username,
    String mobile,
    String password,
    String passwordConfirm,
  ) async {
    const endpoint = Endpoints.register;
    final requestBody = {
      "email": email,
      "username": username,
      "mobile": mobile,
      "password": password,
      "passwordConfirm": passwordConfirm,
    };
    print(requestBody);
    final response = await authDio.post(endpoint, data: requestBody);
    log(response.statusMessage.toString());
    if (response.statusCode == 201) {
      return RegisterResponse.fromJson(response.data);
    }
    throw Exception();
  }
}
