import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {
  LoginEvent();

  @override
  List<Object> props = [];
}


class LoginSubmitEvent extends LoginEvent {
  final String email;
  final String password;

  LoginSubmitEvent({required this.email, required this.password});

  @override
  List<Object> get props => [email, password];
}

class PasswordVisibilityEvent extends LoginEvent {}
class LoginCheckBoxEvent extends LoginEvent {}

