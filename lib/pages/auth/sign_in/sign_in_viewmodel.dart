import 'package:flareline_crm/pages/auth/sign_in/sign_in_state.dart';
import 'package:flareline_uikit/core/mvvm/bloc/bloc_base_viewmodel.dart';
import 'package:flutter/material.dart';

class SignInViewModel extends BlocBaseViewModel<SignInState> {
  late TextEditingController emailController;
  late TextEditingController passwordController;

  SignInViewModel(BuildContext context) : super(context, SignInState()) {
    emailController = TextEditingController(text: state.userName);
    passwordController = TextEditingController(text: state.password);
  }

  Future<void> signInWithGoogle() async {}

  Future<void> signInWithGithub() async {}

  Future<void> signIn() async {
    if (emailController.text.trim() == 'admin' &&
        passwordController.text.trim() == '123456') {
      emit(SignInState()..loginStatus = true);
    } else {
      state.loginStatus = false;
    }
  }

  @override
  void onSafeDispose() {
    emailController.dispose();
    passwordController.dispose();
    super.onSafeDispose();
  }
}
