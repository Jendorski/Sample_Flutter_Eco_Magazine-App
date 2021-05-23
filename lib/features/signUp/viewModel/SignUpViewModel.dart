import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sample_eco_magazine_app/services/locator.dart';
import 'package:sample_eco_magazine_app/services/navigationService/navigator.gr.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:sample_eco_magazine_app/services/signUpService/SignUpService.dart';

class SignUpViewModel extends BaseViewModel{

  BuildContext _buildContext;

  bool _obscureText = true;
  bool get obscureText => _obscureText;

  String _validationMesaage;
  String get validationMessage => _validationMesaage;

  final _navigationService = locator<NavigationService>();
  final _authenticationService = locator<SignUpService>();

  void init(BuildContext context) {
    this._buildContext = context;
  }

  toggleButton() {
    _obscureText = !_obscureText;
    notifyListeners();
  }

  void requestFocus({FocusNode focusNode}) {
    FocusScope.of(_buildContext).requestFocus(focusNode);
  }

  void disposeFocus() {
    FocusScope.of(_buildContext).unfocus();
  }

  Future performSignup({
    String firstName,
    String lastName,
    String phoneNumber,
    String email,
    String password,
  }) async {
    setBusy(true);
    final result = await _authenticationService.signUpUser(
        firstName: firstName,
        email: email,
        lastName: lastName,
        password: password,
        phoneNumber: phoneNumber);
    setBusy(false);
    if (result is bool) {
      if (result) {
        _navigationService.replaceWith(Routes.Login);
      } else {
        _validationMesaage = 'Something seems to be wrong! Try again.';
        _clearErrorText();
        notifyListeners();
      }
    } else {
      _validationMesaage = result;
      _clearErrorText();
      notifyListeners();
    }
  }

  _clearErrorText() {
    Duration _duration = Duration(seconds: 3);
    Timer(_duration, _errorText);
  }

  _errorText() {
    _validationMesaage = '';
    notifyListeners();
  }

  moveToLogin() {
    _navigationService.navigateTo(Routes.Login);
  }

}