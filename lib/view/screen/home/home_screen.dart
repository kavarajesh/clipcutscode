import 'package:clipcuts/resources/const/font_const.dart';
import 'package:clipcuts/resources/shared/shared_pref.dart';
import 'package:clipcuts/view/screen/login/login_screen.dart';
import 'package:clipcuts/view/widget/app_button.dart';
import 'package:clipcuts/view/widget/comman.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../resources/const/app_colors.dart';
import '../../../resources/const/const.dart';
import '../../../resources/const/image_const.dart';
import '../../widget/loading.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  TextEditingController searchController = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30).r,
                bottomRight: Radius.circular(30).r,
              ),
            ),
            padding: EdgeInsets.only(
              top: 50,
              bottom: 10,
              right: 10,
              left: 20,
            ).r,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  alignment: Alignment.center,
                  height: 50.h,
                  width: 50.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadiusGeometry.circular(20),
                    child: Image.asset(
                      "assets/images/profile_image.jpg",
                      width: 40,
                      height: 40,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20).r,
                  child: Text(
                    "ClipCuts",
                    style: textStyle(
                      fontFamily: pattayaFont,
                      color: Colors.white,
                      fontSize: 28,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    showFilterBottomSheet(context);
                  },
                  child: SvgPicture.asset(logoutSvg),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                searchTextField(),
                Expanded(
                  child: ListView.builder(
                    itemCount: 8,
                    padding: EdgeInsets.symmetric(horizontal: 20).r,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.only(bottom: 14).r,
                        padding: EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 16,
                        ).r,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(14),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.08),
                              blurRadius: 12,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            Row(
                              spacing: 20.h,
                              children: [
                                Image.asset(
                                  "assets/images/dog1.png",
                                  width: 50.h,
                                  height: 50.h,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      spacing: 10,
                                      children: [
                                        Text(
                                          "Charlie",
                                          style: textStyle(
                                            fontWeight: FontWeight.w600,
                                            color: primaryText,
                                            fontSize: 15,
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                            vertical: 4,
                                            horizontal: 8,
                                          ).r,
                                          decoration: BoxDecoration(
                                            color: lightBlueColor,
                                            borderRadius:
                                                BorderRadiusGeometry.circular(
                                                  20.r,
                                                ),
                                          ),
                                          child: Text(
                                            "Male",
                                            style: textStyle(
                                              color: blueTextColor,
                                              fontSize: 10,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      "ID:A0001",
                                      style: textStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                        color: greyTextColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                bottom: 10,
                                top: 5,
                              ).r,
                              child: Divider(color: lightGrayColor),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                textWidget(matingDate.tr(), "12/12/23"),
                                textWidget(breedingPartner.tr(), "Emmy"),
                                textWidget(pregnancy.tr(), "Y"),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget searchTextField() {
    return Container(
      margin: const EdgeInsets.only(top: 20, left: 20, bottom: 20),
      padding: const EdgeInsets.symmetric(horizontal: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: TextField(
        controller: searchController,
        style: textStyle(),
        onChanged: (value) {
          print(value);
        },
        decoration: InputDecoration(
          hintText: searchText.tr(),
          contentPadding: EdgeInsets.symmetric(vertical: 10.h),
          hintStyle: const TextStyle(color: Colors.grey, fontSize: 14),
          suffixIcon: Container(
            padding: EdgeInsets.symmetric(vertical: 8).r,
            child: SvgPicture.asset(searchSvg),
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }

  Widget textWidget(String text, String text2) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: textStyle(
            fontSize: 10,
            fontWeight: FontWeight.w600,
            color: greyTextColor,
          ),
        ),
        Text(
          text2,
          style: textStyle(fontSize: 13, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }

  void showFilterBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            spacing: 20,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: lightGrayColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              Text(
                logoutMessage.tr(),
                style: textStyle(fontSize: 22, fontWeight: FontWeight.w700),
                textAlign: TextAlign.center,
              ),

              Row(
                spacing: 20,
                children: [
                  Expanded(
                    child: AppButton(
                      buttonText: yes.tr(),
                      color: lightGrayColor,
                      style: textStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                      onTap: () {
                        Navigator.pop(context, true);
                      },
                    ),
                  ),
                  Expanded(
                    child: AppButton(
                      buttonText: no.tr(),
                      onTap: () {
                        Navigator.pop(context, false);
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    ).then((value) async {
      if (value != null && value) {
        showLoading(context);
        await Future.delayed(Duration(seconds: 1));
        dismissLoading();
        await SharedPrefs.removeData();
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => LoginScreen()),
          (route) => false,
        );
      }
    });
  }
}
