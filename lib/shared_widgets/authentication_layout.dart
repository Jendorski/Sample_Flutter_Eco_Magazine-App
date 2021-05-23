import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:sample_eco_magazine_app/shared_widgets/colors.dart';
import 'app_button_style_one.dart';
import 'app_button_style_two.dart';

class AuthenticationLayout extends StatefulWidget {
  final String title;
  final String mainButtonTitle;
  final String routeButtonTitle;
  final String routeChoiceTitle;
  final String validationMessage;
  final double topHeightSize;
  final double sizeFromForm;
  final Widget form;
  final Function onMainButtonTap;
  final Function onRouteButtonTap;
  final bool busy;
  const AuthenticationLayout({
    Key key,
    this.title,
    this.mainButtonTitle,
    this.routeButtonTitle,
    this.routeChoiceTitle,
    this.validationMessage,
    this.form,
    this.onMainButtonTap,
    this.onRouteButtonTap,
    this.busy,
    this.topHeightSize,
    this.sizeFromForm,
  }) : super(key: key);

  @override
  _AuthenticationLayoutState createState() => _AuthenticationLayoutState();
}

class _AuthenticationLayoutState extends State<AuthenticationLayout> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(left: 16, right: 16),
      children: [
        SizedBox(
          height: widget.topHeightSize.h ?? 40.h,
        ),
        Text(
          widget.title.toUpperCase(),
          style: GoogleFonts.oswald(fontSize: 24.ssp),
        ),
        SizedBox(
          height: widget.sizeFromForm.h,
        ),
        Form(
          key: _formKey,
          child: widget.form,
        ),
        SizedBox(
          height: widget.validationMessage != null ? 41.h : 65.h,
        ),
        if (widget.validationMessage != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Text(
              widget.validationMessage,
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                fontSize: 12.ssp,
                color: warningColor,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        widget.busy
            ? Center(
                child: CircularProgressIndicator(),
              )
            : AppButtonStyleOne(
                buttonTitle: widget.mainButtonTitle,
                color: primaryColor,
                onTap: () {
                  if (_formKey.currentState.validate()) {
                    widget.onMainButtonTap();
                  }
                },
              ),
        SizedBox(
          height: 24.h,
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 15),
          width: double.infinity,
          height: 50.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                  child: Opacity(
                child: Divider(
                  color: neutralColor,
                  height: 2.h,
                  thickness: 2.0,
                ),
                opacity: .45,
              )),
              SizedBox(
                width: 10.w,
              ),
              Opacity(
                opacity: 0.45,
                child: Text(
                  widget.routeChoiceTitle,
                  style: GoogleFonts.oswald(
                    color: neutralColor,
                    fontSize: 14.ssp,
                  ),
                ),
              ),
              SizedBox(
                width: 10.w,
              ),
              Expanded(
                  child: Opacity(
                child: Divider(
                  color: neutralColor,
                  height: 2.h,
                  thickness: 2.0,
                ),
                opacity: .45,
              ))
            ],
          ),
        ),
        SizedBox(
          height: 24.h,
        ),
        AppButtonStyleTwo(
          buttonTitle: widget.routeButtonTitle,
          onTap: widget.onRouteButtonTap,
        ),
        SizedBox(
          height: 20.h,
        ),
      ],
    );
  }
}
