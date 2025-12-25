import 'package:clipcuts/resources/const/app_colors.dart';
import 'package:clipcuts/resources/const/validation.dart';
import 'package:clipcuts/view/screen/login/bloc/login_block.dart';
import 'package:clipcuts/view/screen/login/bloc/login_state.dart';
import 'package:clipcuts/view/screen/signup/sign_up_screen.dart';
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
import '../../widget/loading.dart';
import '../../widget/title_view.dart';
import '../home/home_screen.dart';
import '../language/language_screen.dart';
import 'bloc/login_event.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  FocusNode emailFocus = FocusNode();
  FocusNode passFocus = FocusNode();
  TextEditingController emailController = TextEditingController(
    text: "kasam79+test@yopmail.com",
  );
  TextEditingController passwordController = TextEditingController(
    text: "Test@123",
  );
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Column(
        children: [
          TitleView(title: welcomeBack.tr(), subtitle: helloMessage.tr()),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20).r,
            child: Form(
              key: _formKey,
              child: BlocConsumer<LoginBloc, LoginState>(
                builder: (context, state) {
                  return Column(
                    spacing: 18.h,
                    children: [
                      AppTextField(
                        controller: emailController,
                        suffixIcon: Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Icon(
                            Icons.email_rounded,
                            color: emailFocus.hasFocus
                                ? primaryColor
                                : lightGrayColor,
                            size: 26.h,
                          ),
                        ),
                        validator: (value) => validateRequiredEmail(value),
                        focusNode: emailFocus,
                        hint: emailText.tr(),
                        onTap: () {
                          setState(() {});
                        },
                      ),
                      AppTextField(
                        controller: passwordController,
                        suffixIcon: Padding(
                          padding: const EdgeInsets.only(right: 20).r,
                          child: GestureDetector(
                            onTap: () {
                              context.read<LoginBloc>().add(
                                PasswordVisibilityEvent(),
                              );
                            },
                            child: Icon(
                              state.isPasswordVisible
                                  ? Icons.visibility_off_sharp
                                  : Icons.visibility_sharp,
                              color: passFocus.hasFocus
                                  ? primaryColor
                                  : lightGrayColor,
                              size: 26.h,
                            ),
                          ),
                        ),
                        obscureText: state.isPasswordVisible,
                        validator: (value) => validatePassword(value),
                        focusNode: passFocus,
                        hint: passwordText.tr(),
                        onTap: () {
                          setState(() {});
                        },
                      ),
                    ],
                  );
                },
                listener: (context, state) {
                  if (state.error != null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          state.error ?? "",
                          style: textStyle(color: Colors.white, fontSize: 12),
                        ),
                      ),
                    );
                  }
                  if (state is LoginSuccessState) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => HomeScreen()),
                    );
                  }
                  if (state.isLoading) {
                    showLoading(context);
                  } else {
                    dismissLoading();
                  }
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 6, right: 20).r,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    BlocBuilder<LoginBloc, LoginState>(
                      builder: (context, state) {
                        return Checkbox(
                          activeColor: Colors.amber,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5).r,
                            side: BorderSide(color: lightGrayColor, width: 0.5),
                          ),
                          value: state.rememberMe,
                          onChanged: (value) {
                            context.read<LoginBloc>().add(LoginCheckBoxEvent());
                          },
                        );
                      },
                    ),
                    Text(
                      rememberMe.tr(),
                      style: textStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LanguageScreen()),
                    );
                  },
                  child: Text(
                    forgotPassword.tr(),
                    style: textStyle(
                      color: Colors.grey,
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20).r,
            child: AppButton(
              buttonText: signIn.tr(),
              onTap: () async {
                if (_formKey.currentState!.validate()) {
                  emailFocus.unfocus();
                  passFocus.unfocus();
                  context.read<LoginBloc>().add(
                    LoginSubmitEvent(
                      email: emailController.text,
                      password: passwordController.text,
                    ),
                  );
                }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20).r,
            child: RichText(
              text: TextSpan(
                style: textStyle(color: Colors.grey, fontSize: 14),
                children: <TextSpan>[
                  TextSpan(text: dontAccount.tr()),
                  TextSpan(
                    text: signUP.tr(),
                    style: textStyle(fontWeight: FontWeight.bold, fontSize: 14),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignUpScreen(),
                          ),
                        );
                      },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
