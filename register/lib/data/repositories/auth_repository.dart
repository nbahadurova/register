import 'package:register/data/contracts/auth_contract.dart';
import 'package:register/data/models/remote/register_model.dart';
import 'package:register/data/services/remote/register_service.dart';

class AuthRepository implements AuthContract {
  AuthRepository(this._authService);

  final RegisterService _authService;
  @override
  Future<RegisterResponse> register(
          String email, String username,
          String password, String passwordConfirm) =>
      _authService.register(email, username, password, passwordConfirm);
}
