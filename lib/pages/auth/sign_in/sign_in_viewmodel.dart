import 'package:flareline_crm/pages/auth/sign_in/sign_in_state.dart';
import 'package:flareline_uikit/service/bloc/bloc_base_viewmodel.dart';
import 'package:flutter/material.dart';

class SignInViewModel extends BlocBaseViewModel<SignInState> {
  late TextEditingController emailController;
  late TextEditingController passwordController;

  SignInViewModel(BuildContext context) : super(context, SignInState()) {
    emailController = TextEditingController(text: state.userName);
    passwordController = TextEditingController(text: state.password);
  }

  Future<void> signInWithGoogle(BuildContext context) async {}

  Future<void> signInWithGithub(BuildContext context) async {}

  Future<void> signIn(BuildContext context) async {
    if (emailController.text.trim() == 'admin' &&
        passwordController.text.trim() == '123456') {
      emit(SignInState()..loginStatus = true);
      Future.delayed(const Duration(seconds: 3),
          () => Navigator.of(context).pushNamed('/'));
    } else {
      state.loginStatus = false;
    }
  }
}
