import 'dart:convert';

import 'package:clipcuts/view/screen/login/models/user_data_model.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static late final SharedPreferences instance;

  static const _kUserData = 'userData';
  static const _kUserToken = 'userToken';
  static const _kEmailVerify = 'emailVerify';

  static setUserToken(String token) {
    instance.setString(_kUserToken, token);
  }

  static setEmailVerify(bool isVerify) {
    instance.setBool(_kEmailVerify, isVerify);
  }

  static getEmailVerify() {
    return instance.getBool(_kEmailVerify);
  }

  static getUserToken() {
    return instance.getString(_kUserToken);
  }

  static Future<SharedPreferences> init() async =>
      instance = await SharedPreferences.getInstance();

  // local store User profile data
  static setUserData(UserDataModel userProfileData) {
    final encode = jsonEncode(userProfileData.toJson());
    instance.setString(_kUserData, encode);
  }

// get User profile data
  static getUserProfileData() async {
    try {
      final jsonString = instance.get(_kUserData);
      if (jsonString != null) {
        final jsonValue = await jsonDecode(jsonString.toString());
        final userProfileData = UserDataModel.fromJson(jsonValue);
        return userProfileData;
      }
    } catch (e) {
      if (kDebugMode) {
        print("Error decoding user profile data: $e");
      }
    }
    // Return a default UserProfileData object in case of any failure
    return UserDataModel();
  }

  static removeData() {
    instance.clear();
  }
}
