import 'package:clipcuts/resources/const/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'comman.dart';

class AppButton extends StatelessWidget {
  String buttonText = "";
  Function()? onTap;
  Widget? child;
  Color color = buttonColor;
  Color textColor = Colors.white;
  double height = 60;
  double? width;
  double radius = 30;
  BorderRadiusGeometry? borderRadius;
  List<BoxShadow>? boxShadow;
  EdgeInsetsGeometry? padding;
  TextStyle? style;

  AppButton(
      {super.key,
      this.buttonText = "",
      this.height = 60,
      this.onTap,
      this.child,
      this.width,
      this.boxShadow,
      this.padding,
      this.radius = 50,
      this.borderRadius,
      this.style,
      this.color = buttonColor,
      this.textColor = Colors.white});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height.h,
        width: width,
        padding: padding,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: color,
          borderRadius: borderRadius ?? BorderRadius.circular(radius).r,
        ),
        child: child ??
            Text(
              buttonText,
              style: style ??
                  textStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1),
              textAlign: TextAlign.center,
            ),
      ),
    );
  }
}


