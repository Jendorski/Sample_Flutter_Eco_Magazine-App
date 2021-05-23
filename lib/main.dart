import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/screenutil_init.dart';
import 'package:sample_eco_magazine_app/services/locator.dart';
import 'package:sample_eco_magazine_app/services/navigationService/navigator.gr.dart' as navRoute;
import 'package:sample_eco_magazine_app/shared_widgets/theme_setup.dart';
import 'package:stacked_services/stacked_services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360, 780),
      allowFontScaling: true,
      builder: () => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Sample EcoMagazine',
        theme: kDarktTheme,
        navigatorKey: StackedService.navigatorKey,
        initialRoute: navRoute.Routes.SplashScreen,
        onGenerateRoute: navRoute.Router().onGenerateRoute,
      ),
    );
  }
}
