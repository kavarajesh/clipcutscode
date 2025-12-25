import 'package:equatable/equatable.dart';

enum Gender { male, female }

abstract class SignupEvent extends Equatable {
  const SignupEvent();

  @override
  List<Object?> get props => [];
}

class SelectGenderEvent extends SignupEvent {
  final Gender gender;

  const SelectGenderEvent(this.gender);

  @override
  List<Object?> get props => [gender];
}

class SignupDataEvent extends SignupEvent {}
