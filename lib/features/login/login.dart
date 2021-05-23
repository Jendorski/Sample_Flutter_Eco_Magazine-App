import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../shared_widgets/app_text_field_one.dart';
import '../../shared_widgets/authentication_layout.dart';
import 'viewModel/LoginViewModel.dart';

class Login extends StatefulWidget {

  static const String login = 'Login';

  Login({Key key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<Login> {
  final _emailController = TextEditingController();

  final _passwordController = TextEditingController();

  final _emailFocusNode = FocusNode();

  final _passwordFocusNode = FocusNode();

  @override
  void dispose() {
    _emailController?.clear();
    _passwordController?.clear();
    _emailFocusNode?.dispose();
    _passwordFocusNode?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
      onModelReady: (model) {
        model.init(context);
      },
      builder: (context, model, child) {
        return Scaffold(
          body: SafeArea(
            child: AuthenticationLayout(
              busy: model.isBusy,
              title: 'log in',
              sizeFromForm: 64,
              topHeightSize: 81,
              mainButtonTitle: 'login',
              routeButtonTitle: 'register',
              routeChoiceTitle: "Don't have an account?",
              validationMessage: model.validationMessage,
              onMainButtonTap: () => model.performLogin(
                email: _emailController.text,
                password: _passwordController.text,
              ),
              onRouteButtonTap: model.moveToSignup,
              form: Column(
                children: [
                  AppTextFieldOne(
                    labelText: 'email address',
                    controller: _emailController,
                    focusNode: _emailFocusNode,
                    keyboardType: TextInputType.emailAddress,
                    validatorMessage: 'email can\'t be empty',
                  ),
                  SizedBox(
                    height: 48,
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
      viewModelBuilder: () => LoginViewModel(),
    );
  }
}
