import 'package:bot_toast/bot_toast.dart';
import 'package:clipcuts/resources/shared/shared_pref.dart';
import 'package:clipcuts/view/screen/language/bloc/language_bloc.dart';
import 'package:clipcuts/view/screen/login/bloc/login_block.dart';
import 'package:clipcuts/view/screen/login/repository/login_repository.dart';
import 'package:clipcuts/view/screen/signup/bloc/signup_bloc.dart';
import 'package:clipcuts/view/screen/splash_screen/splash_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await SharedPrefs.init();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  //await Firebase.initializeApp();
  runApp(MultiBlocProvider(
    providers: [
        BlocProvider(create: (context) => LanguageBloc()),
        BlocProvider(create: (context) => LoginBloc(LoginRepostitory())),
        BlocProvider(create: (context) => SignupBloc()),
    ],
    child: EasyLocalization(
        supportedLocales: const [Locale('en'), Locale('hi')],
        path: 'assets/translations',
        saveLocale: true,
        startLocale: const Locale('en'),
        child: const MyApp()),
  ));
  //runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_ , child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          theme: ThemeData(
            primarySwatch: Colors.blue,
            textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
          ),
          builder: BotToastInit(),
          navigatorObservers: [BotToastNavigatorObserver()],
          home: SplashScreen(),
        );
      },

    );
  }
}

