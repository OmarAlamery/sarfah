import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sarfah/core/networking/firebase_helper.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  final FirebaseHelper firebaseHelper;
  SignupCubit(this.firebaseHelper) : super(SignupInitial());
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmationController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  signUp() async {
    emit(SignupLoadingState());
    try {
      await firebaseHelper
          .registerUser(
              emailController.text.trim(), passwordController.text.trim())
          .then((value) => emit(SignupSuccessState()));
    } catch (e) {
      emit(SignupErrorState());
    }
  }
}
