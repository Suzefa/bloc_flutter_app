import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/api_handling/user_service.dart';
import '../../../data/models/user_model.dart';
import '../../../presentation/utilities/custom_dialog.dart';
import '../../../presentation/utilities/regex_validation.dart';

part 'sign_up_screen_event.dart';
part 'sign_up_screen_state.dart';

class SignUpScreenBloc extends Bloc<SignUpScreenEvent, SignUpScreenState> with CustomDialog{
  final TextEditingController firstNameEditingController = TextEditingController();
  final TextEditingController lastNameEditingController = TextEditingController();
  final TextEditingController fatherNameEditingController = TextEditingController();
  final TextEditingController emailEditingController = TextEditingController();
  final TextEditingController passwordEditingController = TextEditingController();
  final TextEditingController confirmPasswordEditingController = TextEditingController();
  final FocusNode firstNameNode = FocusNode();
  final FocusNode lastNameNode = FocusNode();
  final FocusNode fatherNameNode = FocusNode();
  final FocusNode emailNode = FocusNode();
  final FocusNode passwordNode = FocusNode();
  final FocusNode confirmPasswordNode = FocusNode();
  final UserService _userService = UserService();
  BuildContext? screenContext;
  String _firstNameErrorMsg = "",
      _lastNameErrorMsg = "",
      _fatherNameErrorMsg = "",
      _emailErrorMsg = "",
      _passwordErrorMsg = "",
      _confirmPasswordErrorMsg = "",
      _privacyPolicyErrorMsg = "";
  Gender _selectedGender = Gender.male;
  bool _privacyPolicyChecked = false;

  SignUpScreenBloc() : super(const SignUpScreenState()) {

    on<FirstNameValidationEvent>(_firstNameValidation);

    on<LastNameValidationEvent>(_lastNameValidation);

    on<FatherNameValidationEvent>(_fatherNameValidation);

    on<EmailValidationEvent>(_emailValidation);

    on<PasswordValidationEvent>(_passwordValidation);

    on<ConfirmPasswordValidationEvent>(_confirmPasswordValidation);

    on<ShowPasswordEvent>(_onShowPassword);

    on<OnButtonPressedEvent>(_onButtonPressedEvent);

    on<OnGenderChangeEvent>(_onGenderChange);

    on<OnSelectPrivacyPolicyEvent>(_onPrivacyPolicyEvent);

  }

  void _firstNameValidation(FirstNameValidationEvent firstNameValidationEvent, Emitter<SignUpScreenState> emit){
    _validateFirstName();
    emit(
      state.updateStateWith(
        firstNameErrorMsg: _firstNameErrorMsg,
      ),
    );
  }

  void _lastNameValidation(LastNameValidationEvent lastNameValidationEvent, Emitter<SignUpScreenState> emit){
    _validateLastName();
    emit(
      state.updateStateWith(
        lastNameErrorMsg: _lastNameErrorMsg,
      ),
    );
  }

  void _fatherNameValidation(FatherNameValidationEvent fatherNameValidationEvent, Emitter<SignUpScreenState> emit){
    _validateFatherName();
    emit(
      state.updateStateWith(
        fatherNameErrorMsg: _fatherNameErrorMsg,
      ),
    );
  }

  void _emailValidation(EmailValidationEvent emailValidationEvent, Emitter<SignUpScreenState> emit){
    _validateEmail();
    emit(
      state.updateStateWith(
        emailErrorMsg: _emailErrorMsg,
      ),
    );
  }

  void _passwordValidation(PasswordValidationEvent passwordValidationEvent, Emitter<SignUpScreenState> emit){
    _validatePassword();
    emit(
      state.updateStateWith(
        passwordErrorMsg: _passwordErrorMsg,
        confirmPasswordErrorMsg: _validateConfirmPassword() ? null : _confirmPasswordErrorMsg,
      ),
    );
  }

  void _confirmPasswordValidation(ConfirmPasswordValidationEvent confirmPasswordValidationEvent, Emitter<SignUpScreenState> emit){
    _validateConfirmPassword();
    emit(
      state.updateStateWith(
        confirmPasswordErrorMsg: _confirmPasswordErrorMsg,
      ),
    );
  }

  void _onButtonPressedEvent(OnButtonPressedEvent onButtonPressedEvent, Emitter<SignUpScreenState> emit) async {
    if(_validateFirstName() & _validateLastName() & _validateFatherName() &
    _validateEmail() & _validatePassword() & _validateConfirmPassword() &
    _validatePrivacyPolicy()) {
      emit(
        state.updateStateWith(
          isLoading: true,
        ),
      );
      UserModel createUser = UserModel(
        firstName: firstNameEditingController.text,
        lastName: lastNameEditingController.text,
        guardianName: fatherNameEditingController.text,
        email: emailEditingController.text,
        password: passwordEditingController.text,
        gender: _selectedGender==Gender.male
            ? "male" : _selectedGender==Gender.female
            ? "female" : "others" ,
      );
      log(createUser.toString());
      dynamic result = await _userService.signUpNewUser(createUser);
      emit(
        state.updateStateWith(
          isLoading: false,
        ),
      );
      if(result is UserModel){
        Navigator.pop(screenContext!);
        floatingDialog(
          "User created successfully.",
          screenContext!,
          isErrorMessage: false,
          seconds: 5,
        );
      } else {
        floatingDialog(
          result,
          screenContext!,
          isErrorMessage: true,
          seconds: 5,
        );
      }
    } else {
      emit(
        state.updateStateWith(
          firstNameErrorMsg: _firstNameErrorMsg,
          lastNameErrorMsg: _lastNameErrorMsg,
          fatherNameErrorMsg: _fatherNameErrorMsg,
          emailErrorMsg: _emailErrorMsg,
          passwordErrorMsg: _passwordErrorMsg,
          confirmPasswordErrorMsg: _confirmPasswordErrorMsg,
          privacyPolicyErrorMsg: _privacyPolicyErrorMsg,
        ),
      );
    }
  }

  void _onShowPassword(ShowPasswordEvent showPasswordEvent, Emitter<SignUpScreenState> emit){
    emit(
      state.updateStateWith(
        hidePassword: !state.hidePassword,
      ),
    );
  }

  void _onGenderChange(OnGenderChangeEvent onGenderChangeEvent, Emitter<SignUpScreenState> emit){
    _selectedGender = onGenderChangeEvent.selectedGender;
    emit(
      state.updateStateWith(
        selectedGender: _selectedGender,
      ),
    );
  }

  void _onPrivacyPolicyEvent(OnSelectPrivacyPolicyEvent onSelectPrivacyPolicyEvent, Emitter<SignUpScreenState> emit){
    _privacyPolicyChecked = !_privacyPolicyChecked;
    _validatePrivacyPolicy();
    emit(
      state.updateStateWith(
        privacyPolicyErrorMsg: _privacyPolicyErrorMsg,
        isPrivacyPolicySelected: _privacyPolicyChecked,
      ),
    );
  }

  void removeFocus() {
    if(firstNameNode.hasFocus) {
      firstNameNode.unfocus();
    } else if(lastNameNode.hasFocus) {
      lastNameNode.unfocus();
    } else if(fatherNameNode.hasFocus) {
      fatherNameNode.unfocus();
    } else if(emailNode.hasFocus) {
      emailNode.unfocus();
    } else if(passwordNode.hasFocus) {
      passwordNode.unfocus();
    } else if(confirmPasswordNode.hasFocus) {
      confirmPasswordNode.unfocus();
    }
  }

  bool _validateFirstName() {
    if(firstNameEditingController.text.isEmpty){
      _firstNameErrorMsg = "Please insert your name";
    } else if(firstNameEditingController.text.length<3) {
      _firstNameErrorMsg = "Insert your full name";
    } else {
      _firstNameErrorMsg = "";
    }
    return _firstNameErrorMsg.isEmpty;
  }

  bool _validatePrivacyPolicy() {
    if(_privacyPolicyChecked){
      _privacyPolicyErrorMsg = "";
    } else {
      _privacyPolicyErrorMsg = "Please accept privacy policy";
    }
    return _privacyPolicyErrorMsg.isEmpty;
  }

  bool _validateLastName() {
    if(lastNameEditingController.text.isEmpty){
      _lastNameErrorMsg = "Please insert your last name";
    } else if(lastNameEditingController.text.length<3) {
      _lastNameErrorMsg = "Insert your full last name";
    } else {
      _lastNameErrorMsg = "";
    }
    return _lastNameErrorMsg.isEmpty;
  }

  bool _validateFatherName() {
    if(fatherNameEditingController.text.isEmpty){
      _fatherNameErrorMsg = "Please insert your father's/spouse's name";
    } else if(fatherNameEditingController.text.length<3) {
      _fatherNameErrorMsg = "Insert your full father's/spouse's name";
    } else {
      _fatherNameErrorMsg = "";
    }
    return _fatherNameErrorMsg.isEmpty;
  }

  bool _validateEmail() {
    if(emailEditingController.text.isEmpty){
      _emailErrorMsg = "Please insert your email";
    } else if(!RegexValidation.isEmail(emailEditingController.text)) {
      _emailErrorMsg = "Invalid email address";
    } else {
      _emailErrorMsg = "";
    }
    return _emailErrorMsg.isEmpty;
  }

  bool _validatePassword() {
    if(passwordEditingController.text.isEmpty){
      _passwordErrorMsg = "Please insert your password";
    } else if(passwordEditingController.text.length<8) {
      _passwordErrorMsg = "Weak password";
    } else {
      _passwordErrorMsg = "";
    }
    return _passwordErrorMsg.isEmpty;
  }

  bool _validateConfirmPassword() {
    if(confirmPasswordEditingController.text.isEmpty){
      _confirmPasswordErrorMsg = "Please insert your password";
    } else if(passwordEditingController.text != confirmPasswordEditingController.text) {
      _confirmPasswordErrorMsg = "Password and confirm password must be same";
    } else {
      _confirmPasswordErrorMsg = "";
    }
    return _confirmPasswordErrorMsg.isEmpty;
  }

  @override
  Future<void> close() {
    firstNameEditingController.dispose();
    firstNameNode.dispose();
    lastNameEditingController.dispose();
    lastNameNode.dispose();
    fatherNameNode.dispose();
    fatherNameEditingController.dispose();
    emailEditingController.dispose();
    emailNode.dispose();
    passwordEditingController.dispose();
    passwordNode.dispose();
    confirmPasswordNode.dispose();
    confirmPasswordEditingController.dispose();
    return super.close();
  }

}

enum Gender{
  male,
  female,
  other,
}