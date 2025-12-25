import 'package:clipcuts/view/screen/language/language_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../resources/const/app_colors.dart';
import '../../resources/const/image_const.dart';
import 'comman.dart';

class TitleView extends StatelessWidget {
  TitleView({super.key, this.title, this.subtitle});

  String? title;
  String? subtitle;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(loginImage),
        Image.asset(loginImage2),
        Image.asset(loginImage3),
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder:
                          (context) => LanguageScreen()),
                    );
                  },
                  child: Container(
                    height: 100.h,
                    width: 100.h,
                    margin: EdgeInsets.only(top: 160, bottom: 20).r,
                    //padding: EdgeInsets.all(16).r,
                    child: Card(
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0).r,
                        child: Image.asset(
                          appLogoImage,
                          height: 63.h,
                          width: 48.h,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Text(
              "$title",
              style: textStyle(fontSize: 24, fontWeight: FontWeight.w700),
            ),
            Text("$subtitle", style: textStyle(color: grayColor)),
          ],
        ),
      ],
    );
  }
}
