import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sample_eco_magazine_app/shared_widgets/colors.dart';

class AppButtonStyleOne extends StatelessWidget {
  final String buttonTitle;
  final Function onTap;
  final Color color;
  final bool isVisible;

  final Alignment alignment;

  const AppButtonStyleOne({Key key, @required this.buttonTitle, this.onTap, this.color, this.isVisible = true, this.alignment})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isVisible,
      child:  GestureDetector(
        onTap: onTap,
        child: Container(
          height: 40.h,
          width: 328.w,
          alignment: alignment,
          color: color,
          child: Center(
              child: Text(
                buttonTitle.toUpperCase() ?? 'Button Title',
                style: GoogleFonts.oswald(
                    fontSize: 14.ssp,
                    fontWeight: FontWeight.w400,
                    color: neutralColor),
              )),
        ),
      ),
    );
  }
}
