import 'dart:io';

import 'package:clipcuts/resources/shared/shared_pref.dart';
import 'package:clipcuts/view/screen/login/models/user_data_model.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../repository/login_repository.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginRepostitory loginRepostitory;

  LoginBloc(this.loginRepostitory) : super(LoginInitialState()) {
    on<LoginSubmitEvent>((event, emit) async {
      emit(state.copyWith(isLoading: true,error: null));
      try {
        final res = await _login(event.email, event.password);
        final userDataModel = UserDataModel.fromJson(res);
        if (userDataModel.status == 200) {
          await SharedPrefs.setUserData(userDataModel);
          emit(state.copyWith(isLoading: false, response: userDataModel));
          emit(LoginSuccessState(userDataModel));
        } else {
          emit(state.copyWith(isLoading: false, error: userDataModel.message,response: userDataModel));
        }
      } catch (e) {
        emit(state.copyWith(isLoading: false, error: e.toString()));
      }
    });

    on<PasswordVisibilityEvent>((event, emit) {
      emit(state.copyWith(isPasswordVisible: !state.isPasswordVisible));
    });

    on<LoginCheckBoxEvent>((event, emit) {
      emit(state.copyWith(rememberMe: !state.rememberMe!));
    });
  }

  _login(String email, String password) async {
    final deviceType = _getDeviceType();
    final deviceId = await _getDeviceId();
    //final deviceToken = await _getDeviceToken();
    final data = await loginRepostitory.loginApi(
      email,
      password,
      deviceId,
      deviceType,
    );
    return data;
  }

  String _getDeviceType() {
    if (Platform.isAndroid) {
      return "Android";
    } else if (Platform.isIOS) {
      return "iOS";
    } else {
      return "Unknown";
    }
  }

  Future<String> _getDeviceId() async {
    final deviceInfo = DeviceInfoPlugin();

    if (Platform.isAndroid) {
      final androidInfo = await deviceInfo.androidInfo;
      return androidInfo.id;
    } else if (Platform.isIOS) {
      final iosInfo = await deviceInfo.iosInfo;
      return iosInfo.identifierForVendor ?? "";
    } else {
      return "";
    }
  }

  // Future<String?> _getDeviceToken() async {
  //   FirebaseMessaging messaging = FirebaseMessaging.instance;
  //   await messaging.requestPermission();
  //   String? token = await messaging.getToken();
  //   return token;
  // }
}
