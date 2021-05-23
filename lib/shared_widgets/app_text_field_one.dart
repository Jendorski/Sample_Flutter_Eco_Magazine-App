import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sample_eco_magazine_app/shared_widgets/colors.dart';

class AppTextFieldOne extends StatelessWidget {
  final String labelText;
  final String hintText;
  final TextEditingController controller;
  final FocusNode focusNode;
  final TextInputType keyboardType;
  final Function onPressed;
  final bool obscureText;
  final bool isPassword;
  final String validatorMessage;

  AppTextFieldOne({
    Key key,
    @required this.labelText,
    this.hintText,
    this.controller,
    this.keyboardType,
    this.onPressed,
    this.validatorMessage,
    this.obscureText = false,
    this.isPassword = false,
    this.focusNode,
  }) : super(key: key);

  // bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      focusNode: focusNode,
      obscureText: isPassword,
      validator: (value) {
        if (value.isEmpty) {
          return validatorMessage;
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: labelText.toUpperCase(),
        labelStyle: GoogleFonts.oswald(
          fontSize: 10.ssp,
          fontWeight: FontWeight.w400,
        ),
        hintText: hintText,
        hintStyle: GoogleFonts.oswald(
          fontSize: 14.ssp,
          fontWeight: FontWeight.w400,
        ),
        suffixIcon: Visibility(
          visible: isPassword,
          child: IconButton(
            icon: Icon(Icons.visibility),
            onPressed: onPressed,
          ),
        ),
        filled: true,
        fillColor: Color(0xff151515),
        border: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xff262626),
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: primaryColor,
          ),
        ),
        errorBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: warningColor,
          ),
        ),
      ),
    );
  }
}
