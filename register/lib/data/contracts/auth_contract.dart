import 'package:register/data/models/remote/register_model.dart';

abstract class AuthContract {
    Future<RegisterResponse> register(
    String email,
    String username,
    // String mobile,
    String password,
    String passwordConfirm,
  );
}