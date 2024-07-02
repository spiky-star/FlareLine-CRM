import 'package:flareline_crm/pages/auth/sign_up/sign_up_state.dart';
import 'package:flareline_uikit/service/bloc/bloc_base_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get_storage/get_storage.dart';

class SignUpViewModel extends BlocBaseViewModel<SignUpState> {
  final box = GetStorage();

  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController rePasswordController;

  SignUpViewModel(BuildContext context) : super(context, SignUpState()) {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    rePasswordController = TextEditingController();
  }

  Future<void> signUp(BuildContext context) async {
    // if (emailController.text.isEmpty ||
    //     passwordController.text.isEmpty ||
    //     rePasswordController.text != passwordController.text) {
    //   SnackBarUtil.showSnack(context, 'Please enter your info');
    //   return;
    // }
    // if (passwordController.text.trim().length < 6) {
    //   SnackBarUtil.showSnack(context, 'Please enter 6+ Characters password');
    //   return;
    // }

    Navigator.of(context).popAndPushNamed('/signUp');
  }
}
