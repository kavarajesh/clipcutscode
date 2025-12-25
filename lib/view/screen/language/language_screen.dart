import 'package:clipcuts/view/screen/language/bloc/language_state.dart';
import 'package:clipcuts/view/widget/app_button.dart';
import 'package:clipcuts/view/widget/comman.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../resources/const/app_colors.dart';
import '../../../resources/const/const.dart';
import '../../widget/title_view.dart';
import 'bloc/language_bloc.dart';
import 'bloc/language_event.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _setDefoultLanguage();
    });
    super.initState();
  }

  _setDefoultLanguage() {
    if (context.locale.languageCode == 'hi') {
      context.read<LanguageBloc>().add(SelectLanguageEvent(AppLanguage.hindi));
    } else {
      context.read<LanguageBloc>().add(
        SelectLanguageEvent(AppLanguage.english),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          TitleView(
            title: chooseLanguage.tr(),
            subtitle: chooseLanguageMsg.tr(),
          ),
          BlocBuilder<LanguageBloc, LanguageState>(
            builder: (context, state) {
              return Column(
                spacing: 14.r,
                children: [
                  GestureDetector(
                    onTap: () {
                      context.read<LanguageBloc>().add(
                        SelectLanguageEvent(AppLanguage.english),
                      );
                    },
                    child: languageCard(
                      state.selectedLanguage == AppLanguage.english,
                      languageList[0]["name"],
                    ),
                  ),

                  GestureDetector(
                    onTap: () {
                      context.read<LanguageBloc>().add(
                        SelectLanguageEvent(AppLanguage.hindi),
                      );
                    },
                    child: languageCard(
                      state.selectedLanguage == AppLanguage.hindi,
                      languageList[1]["name"],
                    ),
                  ),
                ],
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.all(20).r,
            child: AppButton(
              buttonText: continueText.tr(),
              onTap: () {
                context.read<LanguageBloc>().add(ApplyLanguageEvent(context));

                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => LoginScreen()),
                // );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget languageCard(bool value, String name) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20).r,
      padding: EdgeInsets.symmetric(horizontal: 20).r,
      height: 60.h,
      decoration: BoxDecoration(
        color: value ? primaryColor.withOpacity(0.2) : lightGray,
        borderRadius: BorderRadius.circular(15).r,
        border: Border.all(color: value ? primaryColor : lightGrayColor),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "$name",
            style: textStyle(
              color: value ? Colors.black : Colors.grey,
              fontSize: 16.sp,
              fontWeight: value ? FontWeight.w500 : FontWeight.w400,
            ),
          ),
          Container(
            height: 22.h,
            width: 22.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: value ? primaryColor : Colors.grey,
                width: 5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
