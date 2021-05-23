import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';

import '../../shared_widgets/app_text_field_one.dart';
import '../../shared_widgets/authentication_layout.dart';
import 'viewModel/SignUpViewModel.dart';

class SignUp extends StatefulWidget {
  SignUp({Key key}) : super(key: key);

  static const String signUp = 'SignUp';

@override
  _SignupViewState createState() => _SignupViewState();
}

class _SignupViewState extends State<SignUp> {

  final _firstNameController = TextEditingController();

  final _emailController = TextEditingController();

  final _passwordController = TextEditingController();

  final _lastNameController = TextEditingController();

  final _phoneNumberController = TextEditingController();

  //The focus node
  final _firstNameFocusNode = FocusNode();

  final _phoneNumberFocusNode = FocusNode();

  final _emailFocusNode = FocusNode();

  final _countryFocusNode = FocusNode();

  final _passwordFocusNode = FocusNode();

  final _lastNameFocusNode = FocusNode();

  @override
  void dispose() {
    _firstNameController.clear();
    _emailController.clear();
    _lastNameController.clear();
    _passwordController.clear();
    _firstNameFocusNode.dispose();
    _emailFocusNode.dispose();
    _countryFocusNode.dispose();
    _passwordFocusNode.dispose();
    _lastNameFocusNode.dispose();
    _phoneNumberFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SignUpViewModel>.reactive(
      onModelReady: (model) {
        model.init(context);
      },
      builder: (context, model, child) {
        return Scaffold(
          body: SafeArea(
            child: AuthenticationLayout(
              busy: model.isBusy,
              title: 'register',
              sizeFromForm: 32,
              topHeightSize: 40,
              mainButtonTitle: 'register',
              routeButtonTitle: 'login',
              routeChoiceTitle: "Already have an account?",
              validationMessage: model.validationMessage,
              onMainButtonTap: () => model.performSignup(
                firstName: _firstNameController.text,
                email: _emailController.text,
                lastName: _lastNameController.text,
                phoneNumber: _phoneNumberController.text,
                password: _passwordController.text,
              ),
              onRouteButtonTap: model.moveToLogin,
              form: Column(
                children: [
                  AppTextFieldOne(
                    labelText: 'first name',
                    controller: _firstNameController,
                    focusNode: _firstNameFocusNode,
                    keyboardType: TextInputType.text,
                    validatorMessage: 'first name can\'t be empty',
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  AppTextFieldOne(
                    labelText: 'last name',
                    controller: _lastNameController,
                    focusNode: _lastNameFocusNode,
                    keyboardType: TextInputType.text,
                    validatorMessage: 'last name can\'t be empty',
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  AppTextFieldOne(
                    labelText: 'email address',
                    controller: _emailController,
                    focusNode: _emailFocusNode,
                    keyboardType: TextInputType.emailAddress,
                    validatorMessage: 'email can\'t be empty',
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  AppTextFieldOne(
                    labelText: 'phone number',
                    controller: _phoneNumberController,
                    focusNode: _phoneNumberFocusNode,
                    keyboardType: TextInputType.phone,
                    validatorMessage: 'phone number can\'t be empty',
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  AppTextFieldOne(
                    labelText: 'password',
                    controller: _passwordController,
                    focusNode: _passwordFocusNode,
                    keyboardType: TextInputType.text,
                    validatorMessage: 'password can\'t be empty',
                    isPassword: true,
                    obscureText: model.obscureText,
                    onPressed: model.toggleButton,
                  ),
                ],
              ),
            ),
          ),
        );
      },
      viewModelBuilder: () => SignUpViewModel(),
    );
  }
}
