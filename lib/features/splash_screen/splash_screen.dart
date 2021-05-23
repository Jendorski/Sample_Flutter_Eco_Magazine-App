import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'viewModel/SplashViewModel.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatelessWidget{

  static const String splashScreen = 'SplashScreen';

  const SplashScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SplashViewModel>.reactive(
      onModelReady: (model) => model.initiateStartUp(),
      builder: (context, model, child) {
        return Scaffold(
          body: Center(
            child: SizedBox(
              height: 100.h,
              width: 200.w,
              child: Icon(Icons.ac_unit),
            ),
          ),
        );
      },
      viewModelBuilder: () => SplashViewModel(),
    );
  }

}