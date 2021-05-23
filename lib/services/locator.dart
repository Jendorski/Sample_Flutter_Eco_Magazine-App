import 'package:sample_eco_magazine_app/services/homeService/HomeService.dart';
import 'package:sample_eco_magazine_app/services/signUpService/SignUpService.dart';
import 'package:sample_eco_magazine_app/services/loginService/LoginService.dart';

import 'package:get_it/get_it.dart';
import 'package:stacked_services/stacked_services.dart';

final GetIt locator = GetIt.instance;

Future<void> setupLocator() async {
  locator.registerLazySingleton(() => NavigationService());

  locator.registerLazySingleton<SignUpService>(() => SignUpServiceImpl());
  locator.registerLazySingleton<LoginService>(() => LoginServiceImpl());
  locator.registerLazySingleton<HomeService>(() => HomeServiceImpl());

}
