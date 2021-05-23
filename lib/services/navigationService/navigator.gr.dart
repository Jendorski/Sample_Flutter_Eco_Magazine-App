// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';

import '../../features/details/details.dart';
import '../../features/home/home.dart';
import '../../features/login/login.dart';
import '../../features/signUp/signup.dart';
import '../../features/splash_screen/splash_screen.dart';

class Routes {
  static const String SplashScreen = '/';
  static const String Login = '/Login';
  static const String SignUp = '/sign-up';
  static const String Home = '/Home';
  static const String details = '/Details';
  static const all = <String>{
    SplashScreen,
    Login,
    SignUp,
    Home,
    details,
  };
}

class Router extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.SplashScreen, page: SplashScreen),
    RouteDef(Routes.Login, page: Login),
    RouteDef(Routes.SignUp, page: SignUp),
    RouteDef(Routes.Home, page: Home),
    RouteDef(Routes.details, page: Details),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    SplashScreen: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => const SplashScreen(),
        settings: data,
      );
    },
    Login: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => Login(),
        settings: data,
      );
    },
    SignUp: (data) {
      final args = data.getArgs<SignUpArguments>(
        orElse: () => SignUpArguments(),
      );
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => SignUp(key: args.key),
        settings: data,
      );
    },
    Home: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => Home(),
        settings: data,
      );
    },
    Details: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => Details(),
        settings: data,
      );
    },
  };
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// SignUp arguments holder class
class SignUpArguments {
  final Key key;
  SignUpArguments({this.key});
}
