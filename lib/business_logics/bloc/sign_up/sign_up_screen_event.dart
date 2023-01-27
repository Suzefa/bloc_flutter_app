part of 'sign_up_screen_bloc.dart';

abstract class SignUpScreenEvent {}

class FirstNameValidationEvent extends SignUpScreenEvent {}

class LastNameValidationEvent extends SignUpScreenEvent {}

class FatherNameValidationEvent extends SignUpScreenEvent {}

class EmailValidationEvent extends SignUpScreenEvent {}

class PasswordValidationEvent extends SignUpScreenEvent {}

class ConfirmPasswordValidationEvent extends SignUpScreenEvent {}

class ShowPasswordEvent extends SignUpScreenEvent {}

class OnButtonPressedEvent extends SignUpScreenEvent {}

class OnSelectPrivacyPolicyEvent extends SignUpScreenEvent {}

class OnGenderChangeEvent extends SignUpScreenEvent {
  final Gender selectedGender;
  OnGenderChangeEvent(this.selectedGender);
}