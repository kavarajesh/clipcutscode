import 'package:clipcuts/view/screen/signup/bloc/signup_event.dart';
import 'package:clipcuts/view/screen/signup/bloc/signup_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  SignupBloc() : super(const SignupState()) {
    on<SelectGenderEvent>((event, emit) {
      emit(state.copyWith(selectedGender: event.gender));
    });

    on<SignupDataEvent>((event, emit) {
      emit(SignupDataState());
    });
  }
}