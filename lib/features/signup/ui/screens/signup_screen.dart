import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sarfah/core/helpers/spacing.dart';
import 'package:sarfah/core/theming/fonts.dart';
import 'package:sarfah/core/theming/my_colors.dart';
import 'package:sarfah/core/widgets/my_button.dart';
import 'package:sarfah/features/signup/logic/cubit/signup_cubit.dart';
import 'package:sarfah/features/signup/ui/widgets/signup_form_fields.dart';
import 'package:sarfah/features/signup/ui/widgets/signup_listener_widget.dart';

import '../../../login/ui/widgets/terms_and_conditions.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: MyColors.blackColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
      ),
      backgroundColor: MyColors.blackColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalSpace(70),
                const SignupFormFields(),
                verticalSpace(20),
                const TermsAndConditions(),
                verticalSpace(30),
                MyButton(
                  gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      stops: [
                        0.0,
                        1.0
                      ],
                      colors: [
                        MyColors.orangeColor,
                        MyColors.yellowColor,
                      ]),
                  onPressed: () {
                    validateThenSignup();
                  },
                  child: Text(
                    'Sign Up',
                    style: FontHelper.font18BoldWhite,
                  ),
                ),
                verticalSpace(20),
                const SignupListenerWidget()
              ],
            ),
          ),
        ),
      ),
    );
  }

  validateThenSignup() {
    if (context.read<SignupCubit>().formKey.currentState!.validate()) {
      context.read<SignupCubit>().signUp();
    }
  }
}
