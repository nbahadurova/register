import 'dart:convert';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:register/data/models/remote/register_model.dart';



class RegisterLocalService {
  RegisterLocalService(this._box);

  final Box<String> _box;

  Future<void> saveLoginResponse(RegisterResponse response) async {
    _box.put('register', jsonEncode(response));
  }

  RegisterResponse? get loginResponse {
    try {
      String? registerResponse = _box.get('login');
      RegisterResponse decodedResponse =
          RegisterResponse.fromJson(jsonDecode(registerResponse!));
      return decodedResponse;
    } catch (e) {
      return null;
    }
  }

  Future<int> clearCache() => _box.clear();
}
