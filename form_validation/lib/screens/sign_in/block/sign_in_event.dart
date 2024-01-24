abstract class SignInEvent {}

class SignTextChangedEvent extends SignInEvent {
  final String emailValue;
  final String passwordValue;

  SignTextChangedEvent(this.emailValue, this.passwordValue);
}

class SignInSubmitted extends SignInEvent {
  final String email;
  final String Password;
  SignInSubmitted(this.email, this.Password);
}
