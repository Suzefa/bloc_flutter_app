part of 'sign_in_screen_bloc.dart';

abstract class SignInScreenEvent {}

class PasswordVisibleEvent extends SignInScreenEvent {}

class EmailValidationEvent extends SignInScreenEvent {}

class PasswordValidationEvent extends SignInScreenEvent {}

class RememberMeEvent extends SignInScreenEvent {}

class SignInButtonEvent extends SignInScreenEvent {}