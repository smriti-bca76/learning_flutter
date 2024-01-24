import 'package:email_validator/email_validator.dart';
import 'package:form_validation/screens/sign_in/block/sign_in_event.dart';
import 'package:form_validation/screens/sign_in/block/sign_in_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInInitialState()) {
    on<SignTextChangedEvent>((event, emit) {
      if (EmailValidator.validate(event.emailValue) == false) {
        emit(SignInErrorState('Please enter a valid emal address'));
      } else if (event.passwordValue.length < 8) {
        emit(SignInErrorState('Please enter valid password '));
      } else {
        emit(SignInValidState());
      }
    });
    on<SignInSubmitted>((event, emit) {
      emit(SignInLoadingState());
    });
  }
}
