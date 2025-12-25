import 'package:clipcuts/view/screen/login/models/user_data_model.dart';
import 'package:equatable/equatable.dart';

class LoginState extends Equatable {
  final bool isLoading;
  final bool isPasswordVisible;
  final UserDataModel? response;
  final String? error;
  final bool? rememberMe;

  const LoginState({
    this.isLoading = false,
    this.isPasswordVisible = false,
    this.response,
    this.error,
    this.rememberMe = false,
  });

  LoginState copyWith({
    bool? isLoading,
    bool? isPasswordVisible,
    UserDataModel? response,
    String? error,
    bool? rememberMe = false,
  }) {
    return LoginState(
      isLoading: isLoading ?? this.isLoading,
      isPasswordVisible: isPasswordVisible ?? this.isPasswordVisible,
      response: response ?? this.response,
      error: error,
      rememberMe: rememberMe ?? this.rememberMe,
    );
  }

  @override
  List<Object?> get props => [
    isLoading,
    isPasswordVisible,
    response,
    error,
    rememberMe,
  ];
}

class LoginInitialState extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginSuccessState extends LoginState {
  final UserDataModel response;

  const LoginSuccessState(this.response);

  @override
  List<Object> get props => [response];
}

class LoginFail extends LoginState {
  final String error;

  const LoginFail(this.error);

  @override
  List<Object> get props => [error];
}
