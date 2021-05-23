import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sample_eco_magazine_app/shared_widgets/colors.dart';

class AppButtonStyleTwo extends StatelessWidget {
  final String buttonTitle;
  final Function onTap;
  const AppButtonStyleTwo({Key key, @required this.buttonTitle, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 40.h,
        width: 328.w,
        decoration: BoxDecoration(
            color: Colors.black,
            border: Border.all(
              color: primaryColor,
            )),
        child: Center(
            child: Text(
          buttonTitle.toUpperCase() ?? 'Button Title',
          style: GoogleFonts.oswald(
            fontSize: 14.ssp,
            fontWeight: FontWeight.w400,
            color: neutralColor,
          ),
        )),
      ),
    );
  }
}
