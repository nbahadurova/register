import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:flutter/material.dart';
import 'package:register/data/contracts/auth_contract.dart';
import 'package:register/data/models/remote/register_model.dart';
import 'package:register/data/services/remote/register_service.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this._registerService) : super(RegisterInitial());
  final RegisterService _registerService;

  final controllers = {
    'email': TextEditingController(),
    'username': TextEditingController(),
    'mobile': TextEditingController(),
    'password': TextEditingController(),
    'password_confirm': TextEditingController(),
  };

  void register() async {
    try {
      emit(RegisterLoading());
      final result = await _registerService.register(
          controllers['email']!.text,
          controllers['username']!.text,
          controllers['mobile']!.text,
          controllers['password']!.text,
          controllers['passwordConfirm']!.text);
      emit(RegisterSuccess(result));
    } on SocketException catch (e) {
      emit(RegisterNetworkError());
    } catch (e) {
      emit(RegisterFailure());
    }
  }

  @override
  Future<void> close() {
    controllers.values.forEach((element) {
      element.dispose();
    });
    return super.close();
  }
}
