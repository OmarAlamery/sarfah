import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sarfah/features/signup/logic/cubit/signup_cubit.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/fonts.dart';
import '../../../../core/widgets/my_text_form_field.dart';

class SignupFormFields extends StatefulWidget {
  const SignupFormFields({
    super.key,
  });

  @override
  State<SignupFormFields> createState() => _SignupFormFieldsState();
}

class _SignupFormFieldsState extends State<SignupFormFields> {
  bool isObsecure = true;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController nameController;
  late TextEditingController passwordConfirmationController;

  @override
  void initState() {
    super.initState();
    emailController = context.read<SignupCubit>().emailController;
    nameController = context.read<SignupCubit>().nameController;
    passwordController = context.read<SignupCubit>().passwordController;
    passwordConfirmationController =
        context.read<SignupCubit>().passwordConfirmationController;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: context.read<SignupCubit>().formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Welcome to Sarfah",
              style: FontHelper.font28SemiBoldWhite,
            ),
            verticalSpace(30),
            Text(
              'Name',
              style: FontHelper.font18BoldWhite,
            ),
            verticalSpace(10),
            MyTextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your name';
                }
                return null;
              },
              controller: nameController,
              isObsecure: false,
              hintText: 'Enter Your Name',
            ),
            verticalSpace(20),
            Text(
              'Email',
              style: FontHelper.font18BoldWhite,
            ),
            verticalSpace(10),
            MyTextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                }
                return null;
              },
              controller: emailController,
              isObsecure: false,
              hintText: 'Enter Your Email',
            ),
            verticalSpace(20),
            Text(
              'Password',
              style: FontHelper.font18BoldWhite,
            ),
            verticalSpace(10),
            MyTextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your password';
                }
                return null;
              },
              controller: passwordController,
              isObsecure: isObsecure,
              suffixIcon: IconButton(
                icon: isObsecure
                    ? Icon(Icons.visibility)
                    : Icon(Icons.visibility_off),
                onPressed: () {
                  {
                    setState(() {
                      isObsecure = !isObsecure;
                    });
                  }
                },
              ),
              hintText: 'Enter your password',
            ),
            verticalSpace(20),
            Text(
              'Password Confirmation',
              style: FontHelper.font18BoldWhite,
            ),
            verticalSpace(10),
            MyTextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please Re-enter your password';
                } else if (passwordConfirmationController.text.trim() !=
                    passwordController.text.trim()) {
                  return "Passwords does not match";
                }
                return null;
              },
              controller: passwordConfirmationController,
              isObsecure: isObsecure,
              suffixIcon: IconButton(
                icon: isObsecure
                    ? Icon(Icons.visibility)
                    : Icon(Icons.visibility_off),
                onPressed: () {
                  {
                    setState(() {
                      isObsecure = !isObsecure;
                    });
                  }
                },
              ),
              hintText: 'Re-enter your password',
            ),
          ],
        ));
  }
}
