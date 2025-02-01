import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:sarfah/core/networking/firebase_helper.dart';
import 'package:sarfah/core/routing/routs.dart';
import 'package:sarfah/features/login/logic/cubit/login_cubit.dart';

class BuildBlocListener extends StatelessWidget {
  const BuildBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listenWhen: (previous, current) =>
          current is LoginSeccessState ||
          current is LoginErrorState ||
          current is LoginLoadingState,
      listener: (context, state) {
        if (state is LoginLoadingState) {
          showDialog(
              context: context,
              builder: (context) => const Center(
                    child: CircularProgressIndicator(),
                  ));
        } else if (state is LoginErrorState) {
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Error Logining in"),
              backgroundColor: Colors.red,
            ),
          );
        } else {
          Navigator.pop(context);
          Navigator.pushReplacementNamed(context, Routes.home);
        }
      },
      child: SizedBox.shrink(),
    );
  }
}
