import 'package:clipcuts/view/screen/signup/bloc/signup_event.dart';
import 'package:equatable/equatable.dart';

class SignupState extends Equatable {
  final Gender? selectedGender;

  const SignupState({this.selectedGender});

  SignupState copyWith({Gender? selectedGender}) {
    return SignupState(
      selectedGender: selectedGender ?? this.selectedGender,
    );
  }

  @override
  List<Object?> get props => [selectedGender];
}

class SignupDataState extends SignupState {}