import 'package:clipcuts/resources/const/app_colors.dart';
import 'package:clipcuts/view/screen/signup/bloc/signup_event.dart';
import 'package:clipcuts/view/screen/signup/bloc/signup_state.dart';
import 'package:clipcuts/view/widget/app_button.dart';
import 'package:clipcuts/view/widget/app_text_field.dart';
import 'package:clipcuts/view/widget/comman.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../resources/const/const.dart';
import '../../../resources/const/image_const.dart';
import 'bloc/signup_bloc.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  FocusNode emailFocus = FocusNode();
  FocusNode passFocus = FocusNode();
  FocusNode nameFocus = FocusNode();
  FocusNode mobileFocus = FocusNode();
  FocusNode confirmPassFocus = FocusNode();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(signUpImage),
            SizedBox(height: 10.h),
            Text(
              hiWelcomeThere.tr(),
              style: textStyle(fontSize: 24, fontWeight: FontWeight.w700),
            ),
            Text(
              pleaseCreateAc.tr(),
              style: textStyle(color: greyColor, fontSize: 16),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20).r,
              child: Column(
                spacing: 10.h,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        uploadProfileText.tr(),
                        style: textStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(25).r,
                        margin: EdgeInsets.only(top: 20).r,
                        decoration: BoxDecoration(
                          border: Border.all(color: lightGrayColor, width: 1),
                          shape: BoxShape.circle,
                          color: lightGray,
                        ),
                        child: SvgPicture.asset(
                          cameraSvg,
                          height: 35.h,
                          width: 35.h,
                        ),
                      ),
                    ],
                  ),
                  AppTextField(
                    hint: nameText.tr(),
                    suffixIcon: Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Icon(
                        Icons.person,
                        color: nameFocus.hasFocus ? primaryColor : greyColor,
                        size: 26.h,
                      ),
                    ),
                    focusNode: nameFocus,
                  ),
                  AppTextField(
                    hint: emailAddress.tr(),
                    suffixIcon: Padding(
                      padding: const EdgeInsets.only(right: 20).r,
                      child: emailFocus.hasFocus
                          ? SvgPicture.asset(mailSvg)
                          : SvgPicture.asset(greyMailSvg),
                    ),
                    focusNode: emailFocus,
                  ),
                  AppTextField(
                    hint: mobileNumber.tr(),
                    suffixIcon: Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Icon(
                        Icons.call,
                        color: mobileFocus.hasFocus ? primaryColor : greyColor,
                        size: 26.h,
                      ),
                    ),
                    focusNode: mobileFocus,
                  ),
                  BlocBuilder<SignupBloc, SignupState>(
                    builder: (context, state) {
                      return Row(
                        spacing: 20.h,
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                context.read<SignupBloc>().add(
                                  SelectGenderEvent(Gender.male),
                                );
                              },
                              child: genderCard(
                                male,
                                state.selectedGender == Gender.male,
                              ),
                            ),
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                context.read<SignupBloc>().add(
                                  SelectGenderEvent(Gender.female),
                                );
                              },
                              child: genderCard(
                                female,
                                state.selectedGender == Gender.female,
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                  AppTextField(
                    hint: passwordText.tr(),
                    suffixIcon: Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Icon(
                        Icons.visibility,
                        color: passFocus.hasFocus ? primaryColor : greyColor,
                        size: 26.h,
                      ),
                    ),
                    focusNode: passFocus,
                  ),
                  AppTextField(
                    hint: confirmPassword.tr(),
                    suffixIcon: Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Icon(
                        Icons.visibility_off_sharp,
                        color: confirmPassFocus.hasFocus
                            ? primaryColor
                            : greyColor,
                        size: 26.h,
                      ),
                    ),
                    focusNode: confirmPassFocus,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 6, right: 20, top: 6).r,
              child: Row(
                children: [
                  Checkbox(
                    activeColor: Colors.amber,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5).r,
                      side: BorderSide(color: lightGrayColor, width: 0.5),
                    ),
                    value: false,
                    onChanged: (value) {},
                  ),
                  Flexible(
                    child: Text(
                      signupAgreeText.tr(),
                      style: textStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0).r,
              child: AppButton(buttonText: signUpText.tr()),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20, top: 10).r,
              child: RichText(
                text: TextSpan(
                  style: textStyle(color: Colors.grey, fontSize: 14),
                  children: <TextSpan>[
                    TextSpan(text: alreadyAc.tr()),
                    TextSpan(
                      text: signUP.tr(),
                      style: textStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.pop(context);
                        },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget genderCard(String gender, bool isSelected) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20).r,
      height: 60.h,
      decoration: BoxDecoration(
        color: lightGray,
        borderRadius: BorderRadius.circular(15).r,
        border: Border.all(color: lightGrayColor),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            gender.tr(),
            style: textStyle(color: isSelected ? Colors.black : Colors.grey),
          ),
          Container(
            height: 22.h,
            width: 22.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: isSelected ? primaryColor : Colors.grey,
                width: 5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
