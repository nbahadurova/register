import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:register/ui/pages/home/home_page.dart';
import 'package:register/cubits/register/register_cubit.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<RegisterCubit>();
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: Column(
        children: [
          TextFormField(
            controller: cubit.controllers['email'],
            decoration: const InputDecoration(
              hintText: "email",
            ),
          ),
          TextFormField(
            controller: cubit.controllers['username'],
            decoration: const InputDecoration(
              hintText: "username",
            ),
          ),
          // TextFormField(
          //   controller: cubit.controllers['mobile'],
          //   decoration: const InputDecoration(
          //     hintText: "mobile",
          //   ),
          // ),
          TextFormField(
            controller: cubit.controllers['password'],
            decoration: const InputDecoration(
              hintText: "password",
            ),
          ),
          TextFormField(
            controller: cubit.controllers['passwordConfirm'],
            decoration: const InputDecoration(
              hintText: "passwordConfirm",
            ),
          ),
          BlocListener<RegisterCubit, RegisterState>(
            listener: (context, state) {
              log(state.runtimeType.toString());
              if (state is RegisterLoading) {
                Container(
                  color: Colors.amber,
                  height: 48,
                  width: 48,
                  child: const CircularProgressIndicator(),
                );
              } else if (state is RegisterSuccess) {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomePage(),
                    ),
                    (route) => false);
              } else if (state is RegisterFailure) {
                // Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    backgroundColor: Colors.red,
                    margin: EdgeInsets.all(24),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    behavior: SnackBarBehavior.floating,
                    content: Text('Error occured while trying to register'),
                  ),
                );
              }
            },
            child: ElevatedButton(
              onPressed: () {
                cubit.register();
              },
              child: const Text("Register"),
            ),
          )
        ],
      ),
    );
  }
}
