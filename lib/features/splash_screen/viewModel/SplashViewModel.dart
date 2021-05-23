import 'dart:async';

import 'package:sample_eco_magazine_app/services/locator.dart';
import 'package:sample_eco_magazine_app/services/navigationService/navigator.gr.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:sample_eco_magazine_app/services/loginService/LoginService.dart';

class SplashViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _loginService = locator<LoginService>();

  initiateStartUp() async {
    Duration _duration = Duration(seconds: 2);
    Timer(_duration, _handleStartupLogic);
  }

  _handleStartupLogic() async {
    final _result = await _loginService.isUserLoggedIn();
    if (_result == true) {
      _navigationService.navigateTo(Routes.Home);
    } else {
      _navigationService.navigateTo(Routes.Login);
    }
  }
}
