import 'package:flareline_crm/core/theme/crm_colors.dart';
import 'package:flareline_crm/pages/auth/sign_in/sign_in_provider.dart';
import 'package:flareline_crm/pages/auth/sign_up/sign_up_provider.dart';
import 'package:flareline_uikit/widget/base/base_stless_widget.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:flareline_uikit/components/buttons/button_widget.dart';
import 'package:flareline_uikit/components/card/common_card.dart';
import 'package:flareline_uikit/components/forms/outborder_text_form_field.dart';
import 'package:responsive_builder/responsive_builder.dart';

class SignInPage extends BaseStlessWidget<SignInProvider> {
  @override
  Widget bodyWidget(
      BuildContext context, SignInProvider viewModel, Widget? child) {
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
  SignInProvider viewModelBuilder(BuildContext context) {
    return SignInProvider(context);
  }

  Widget contentDesktopWidget(BuildContext context, SignInProvider viewModel) {
    return Column(mainAxisSize: MainAxisSize.min, children: [
      Row(mainAxisSize: MainAxisSize.min, children: [
        SizedBox(
          width: 500,
          child:
          SvgPicture.asset('assets/signin/main.svg', semanticsLabel: ''),
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

  Widget contentMobileWidget(BuildContext context, SignInProvider viewModel) {
    return CommonCard(
      padding: const EdgeInsets.symmetric(vertical: 60),
      child: _formWidget(context, viewModel),
    );
  }

  Widget _formWidget(BuildContext context, SignInProvider viewModel) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Welcome back',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'Welcome back!Please enter your details!',
            style: TextStyle(
              fontSize: 12,
            ),
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
          OutBorderTextFormField(
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
          const SizedBox(
            height: 20,
          ),
          ButtonWidget(
            type: ButtonType.primary.type,
            btnText: 'Sign in',
            onTap: () {
              Navigator.of(context).popAndPushNamed('/');
            },
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Don\'t have account'),
              SizedBox(
                width: 10,
              ),
              InkWell(
                child: const Text(
                  'Sign Up',
                  style: TextStyle(color: Colors.blue),
                ),
                onTap: () {
                  Navigator.of(context).popAndPushNamed('/signUp');
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
            btnText: 'Sign In With Google',
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
            btnText: 'Sign In With Github',
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
            btnText: 'Sign In With Microsoft',
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
