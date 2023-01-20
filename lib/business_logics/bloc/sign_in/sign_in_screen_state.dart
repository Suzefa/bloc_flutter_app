part of 'sign_in_screen_bloc.dart';

abstract class SignInScreenState {}

class SignInScreenInitial extends SignInScreenState {
  final bool showPassword;
  SignInScreenInitial(this.showPassword);
}

class PasswordFieldObscure extends SignInScreenState {
  final bool showPassword;
  PasswordFieldObscure(this.showPassword);
}

class InvalidEmailFieldState extends SignInScreenState {
  final String errorMsg;
  final Color errorColor;
  InvalidEmailFieldState(this.errorMsg,this.errorColor);
}

class ValidEmailFieldState extends SignInScreenState {}

class InvalidPasswordFieldState extends SignInScreenState {
  final String errorMsg;
  final Color errorColor;
  InvalidPasswordFieldState(this.errorMsg,this.errorColor);
}

class ValidPasswordFieldState extends SignInScreenState {}