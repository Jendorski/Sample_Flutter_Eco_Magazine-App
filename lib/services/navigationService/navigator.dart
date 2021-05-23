import 'package:auto_route/auto_route_annotations.dart';
import 'package:sample_eco_magazine_app/features/details/details.dart';
import 'package:sample_eco_magazine_app/features/home/home.dart';
import 'package:sample_eco_magazine_app/features/login/login.dart';
import 'package:sample_eco_magazine_app/features/signUp/signup.dart';
import 'package:sample_eco_magazine_app/features/splash_screen/splash_screen.dart';

@AdaptiveAutoRouter(routes: <AutoRoute>[
  AdaptiveRoute(page: SplashScreen, name: SplashScreen.splashScreen, initial: true),
  AdaptiveRoute(page: Login, name: Login.login),
  AdaptiveRoute(page: SignUp, name: SignUp.signUp),
  AdaptiveRoute(page: Home, name: Home.home),
  AdaptiveRoute(page: Details, name: Details.details),
])
class $Router {}
