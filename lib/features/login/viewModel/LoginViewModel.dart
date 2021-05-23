import 'dart:async';

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'package:sample_eco_magazine_app/services/locator.dart';
import 'package:sample_eco_magazine_app/services/navigationService/navigator.gr.dart';
import 'package:sample_eco_magazine_app/services/loginService/LoginService.dart';


class LoginViewModel extends BaseViewModel {
  bool _obscureText = true;
  bool get obscureText => _obscureText;

  BuildContext _context;

  String _validationMesaage;
  String get validationMessage => _validationMesaage;

  final _authenticationService = locator<LoginService>();
  final _navigationService = locator<NavigationService>();

  /// This helps to initialise [BuildContext] inside our ViewModel class.
  init(BuildContext context) {
    _context = context;
  }

  toggleButton() {
    _obscureText = !_obscureText;
    notifyListeners();
  }

  requestFocus({FocusNode focusNode}) {
    FocusScope.of(_context).requestFocus(focusNode);
    notifyListeners();
  }

  disposeFocus() {
    FocusScope.of(_context).unfocus();
  }

  Future performLogin({String email, String password}) async {
    setBusy(true);
    final response = await _authenticationService.signInUser(
        email: email, password: password);
    setBusy(false);
    if (response is bool) {
      if (response) {
        print('moving to wrapper View');
        _navigationService.pushNamedAndRemoveUntil(Routes.Home);
      } else {
        _validationMesaage = 'Something seems to have gone wrong';
      }
    } else {
      _validationMesaage = response;
      _clearErrorText();
    }
    notifyListeners();
  }

  _clearErrorText() {
    Duration _duration = Duration(seconds: 3);
    Timer(_duration, _errorText);
  }

  _errorText() {
    _validationMesaage = '';
    notifyListeners();
  }

  // performLogin({String email, String password}) {
  //   print('Email: $email');
  //   print('Password: $password');
  //   print('login happening');
  //   _navigationService.pushNamedAndRemoveUntil(Routes.wrapper_view);
  // }

  moveToSignup() {
    print('you just moved to signup');
    _navigationService.navigateTo(Routes.SignUp);
  }
}
