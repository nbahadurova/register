import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:register/utils/di/locator.dart';
import 'package:register/ui/pages/home/home_page.dart';
import 'package:register/cubits/register/register_cubit.dart';
import 'package:register/ui/pages/register/register_page.dart';

class Pager {
  Pager._();

  static Widget get register => BlocProvider(
        create: (context) => RegisterCubit(locator()),
        child: const RegisterPage(),
      );
  static Widget get home => const HomePage();
}
