import 'package:clipcuts/resources/shared/shared_pref.dart';
import 'package:clipcuts/view/screen/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../resources/const/app_colors.dart';
import '../../../resources/const/image_const.dart';
import '../home/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
      _autoLogin();
    });
  }

  Future _autoLogin() async {
    final pref = await SharedPrefs.getUserToken();
    if (pref != null && pref.isNotEmpty) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            splashImage,
            width: 375.w,
            height: 812.h,
            fit: BoxFit.cover,
          ),
          Container(
            decoration: BoxDecoration(color: primaryColor.withOpacity(0.4)),
          ),
          Image.asset(ellipseImage1),
          SvgPicture.asset(splashSvg),
          Align(
            alignment: Alignment.bottomRight,
            child: SvgPicture.asset(splashSvg4),
          ),
          Align(
            alignment: Alignment.center,
            child: Image.asset(appIconSvg, height: 197.h, width: 164.w),
          ),
        ],
      ),
    );
  }
}
