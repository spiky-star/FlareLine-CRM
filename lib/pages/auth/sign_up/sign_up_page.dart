import 'package:flareline_crm/core/theme/crm_colors.dart';
import 'package:flareline_crm/pages/auth/sign_up/sign_up_state.dart';
import 'package:flareline_crm/pages/auth/sign_up/sign_up_viewmodel.dart';
import 'package:flareline_uikit/core/mvvm/bloc/bloc_base_stless_widget.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:flareline_uikit/components/buttons/button_widget.dart';
import 'package:flareline_uikit/components/card/common_card.dart';
import 'package:flareline_uikit/components/forms/outborder_text_form_field.dart';
import 'package:responsive_builder/responsive_builder.dart';

class SignUpPage extends BlocBaseStlessWidget<SignUpViewModel, SignUpState> {
  @override
  Widget bodyWidget(
      BuildContext context, SignUpViewModel viewModel, SignUpState state) {
    return Scaffold(body: ResponsiveBuilder(
      builder: (context, sizingInformation) {
        // Check the sizing information here and return your UI
        if (sizingInformation.deviceScreenType == DeviceScreenType.desktop) {
          return Center(
            child: contentDesktopWidget(context, viewModel),
          );
        }

        return contentMobileWidget(context, viewModel);
      },
    ));
  }

  @override
  SignUpViewModel viewModelBuilder(BuildContext context) {
    return SignUpViewModel(context);
  }

  Widget contentDesktopWidget(BuildContext context, SignUpViewModel viewModel) {
    return Column(mainAxisSize: MainAxisSize.min, children: [
      Row(mainAxisSize: MainAxisSize.min, children: [
        SizedBox(
          width: 500,
          child:
              SvgPicture.asset('assets/signin/signup.svg', semanticsLabel: ''),
        ),
        const SizedBox(
          width: 32,
        ),
        CommonCard(
          width: 430,
          child: _formWidget(context, viewModel),
        )
      ]),
    ]);
  }

  Widget contentMobileWidget(BuildContext context, SignUpViewModel viewModel) {
    return CommonCard(
      padding: const EdgeInsets.symmetric(vertical: 60),
      child: _formWidget(context, viewModel),
    );
  }

  Widget _formWidget(BuildContext context, SignUpViewModel viewModel) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Create an account',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'Let\'s get started with your 30 day free trial',
            style: TextStyle(
              fontSize: 12,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            children: [
              Expanded(
                child: OutBorderTextFormField(
                  hintText: 'First Name',
                  keyboardType: TextInputType.emailAddress,
                  icon: Container(
                    margin: const EdgeInsets.only(right: 8, left: 8),
                    child: SvgPicture.asset(
                      'assets/signin/email.svg',
                      width: 20,
                      height: 20,
                    ),
                  ),
                  controller: viewModel.emailController,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: OutBorderTextFormField(
                  hintText: 'Last Name',
                  keyboardType: TextInputType.emailAddress,
                  icon: Container(
                    margin: const EdgeInsets.only(right: 8, left: 8),
                    child: SvgPicture.asset(
                      'assets/signin/email.svg',
                      width: 20,
                      height: 20,
                    ),
                  ),
                  controller: viewModel.emailController,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          OutBorderTextFormField(
            hintText: 'enter your email',
            keyboardType: TextInputType.emailAddress,
            icon: Container(
              margin: const EdgeInsets.only(right: 8, left: 8),
              child: SvgPicture.asset(
                'assets/signin/email.svg',
                width: 20,
                height: 20,
              ),
            ),
            controller: viewModel.emailController,
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            children: [
              Expanded(
                child: OutBorderTextFormField(
                  obscureText: true,
                  hintText: 'Password',
                  icon: Container(
                    margin: const EdgeInsets.only(right: 8, left: 8),
                    child: SvgPicture.asset(
                      'assets/signin/lock.svg',
                      width: 20,
                      height: 20,
                    ),
                  ),
                  controller: viewModel.passwordController,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: OutBorderTextFormField(
                  obscureText: true,
                  hintText: 'Confirm Password',
                  icon: Container(
                    margin: const EdgeInsets.only(right: 8, left: 8),
                    child: SvgPicture.asset(
                      'assets/signin/lock.svg',
                      width: 20,
                      height: 20,
                    ),
                  ),
                  controller: viewModel.passwordController,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          ButtonWidget(
            type: ButtonType.primary.type,
            btnText: 'Sign up',
            onTap: () {
              viewModel.signUp(context);
            },
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('have account'),
              SizedBox(
                width: 10,
              ),
              InkWell(
                child: const Text(
                  'Sign In',
                  style: TextStyle(color: Colors.blue),
                ),
                onTap: () {
                  Navigator.of(context).popAndPushNamed('/signIn');
                },
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              const Expanded(
                  child: Divider(
                height: 1,
                color: CrmColors.border,
              )),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: const Text('Or'),
              ),
              const Expanded(
                  child: Divider(
                height: 1,
                color: CrmColors.border,
              )),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          ButtonWidget(
            color: Colors.white,
            borderColor: CrmColors.border,
            iconWidget: SvgPicture.asset(
              'assets/brand/brand-01.svg',
              width: 25,
              height: 25,
            ),
            btnText: 'Sign Up With Google',
            onTap: () {},
          ),
          const SizedBox(
            height: 20,
          ),
          ButtonWidget(
            color: Colors.white,
            borderColor: CrmColors.border,
            iconWidget: SvgPicture.asset(
              'assets/brand/brand-03.svg',
              width: 25,
              height: 25,
            ),
            btnText: 'Sign Up With Github',
            onTap: () {},
          ),
          const SizedBox(
            height: 20,
          ),
          ButtonWidget(
            color: Colors.white,
            borderColor: CrmColors.border,
            iconWidget: SvgPicture.asset(
              'assets/brand/microsoft.svg',
              width: 25,
              height: 25,
            ),
            btnText: 'Sign Up With Microsoft',
            onTap: () {},
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }

  @override
  bool get isPage => true;

  @override
  bool get showTitle => false;

  @override
  bool get isAlignCenter => true;
}
