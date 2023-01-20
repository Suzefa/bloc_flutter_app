
import 'package:example_project/presentation/utilities/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'sign_in_screen_event.dart';
part 'sign_in_screen_state.dart';

class SignInScreenBloc extends Bloc<SignInScreenEvent, SignInScreenState> {
  SignInScreenBloc() : super(SignInScreenInitial(true)) {
    on<PasswordVisibleEvent>((event, emit){
      _showPassword = !_showPassword;
      emit(PasswordFieldObscure(_showPassword));
    });

    on<EmailValidationEvent>(_onEmailValidateEvent);

    on<PasswordValidationEvent>(_onPasswordValidateEvent);

  }

  final TextEditingController emailEditingController = TextEditingController();
  final FocusNode emailFocusNode = FocusNode();
  final TextEditingController passwordEditingController = TextEditingController();
  final FocusNode passwordFocusNode = FocusNode();
  bool _showPassword = false;
  String _emailErrorMsg = "", _passwordErrorMsg="";

  void removeFocus(){
    if(passwordFocusNode.hasFocus){
      passwordFocusNode.unfocus();
    }else if(emailFocusNode.hasFocus){
      emailFocusNode.unfocus();
    }
  }

  bool _validateEmail(){
    if(emailEditingController.text.isEmpty){
      _emailErrorMsg = "Email is required";
    } else if(!(RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(emailEditingController.text))) {
      _emailErrorMsg = "Invalid email address";
    } else {
      _emailErrorMsg = "";
    }
    return _emailErrorMsg.isEmpty;
  }

  bool _validatePassword(){
    if(passwordEditingController.text.isEmpty){
      _passwordErrorMsg = "Email is required";
    } else if(passwordEditingController.text.trim().length<8) {
      _passwordErrorMsg = "Password is too short";
    } else {
      _emailErrorMsg = "";
    }
    return _emailErrorMsg.isEmpty;
  }

  void _onPasswordValidateEvent(PasswordValidationEvent event, Emitter<SignInScreenState> emit){
    if(_validatePassword()){
      emit(ValidPasswordFieldState());
    }else{
      emit(InvalidPasswordFieldState(_passwordErrorMsg,ColorConstant.kRedColor));
    }
  }

  void _onEmailValidateEvent(EmailValidationEvent event, Emitter<SignInScreenState> emit){
    if(_validateEmail()){
      emit(ValidEmailFieldState());
    } else {
      emit(InvalidEmailFieldState(_emailErrorMsg, ColorConstant.kRedColor));
    }
  }

  @override
  Future<void> close() {
    emailEditingController.dispose();
    passwordEditingController.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    return super.close();
  }
}
