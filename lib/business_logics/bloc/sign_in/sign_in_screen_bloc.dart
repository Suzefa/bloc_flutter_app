
import 'package:equatable/equatable.dart';
import 'package:example_project/presentation/utilities/regex_validation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/api_handling/user_service.dart';
import '../../../data/models/user_model.dart';
import '../../../presentation/utilities/custom_dialog.dart';

part 'sign_in_screen_event.dart';
part 'sign_in_screen_state.dart';

class SignInScreenBloc extends Bloc<SignInScreenEvent, SignInScreenState> with CustomDialog{

  final TextEditingController emailEditingController = TextEditingController();
  final FocusNode emailFocusNode = FocusNode();
  final TextEditingController passwordEditingController = TextEditingController();
  final FocusNode passwordFocusNode = FocusNode();
  final UserService _userService = UserService();
  BuildContext? screenContext;
  bool _showPassword = true,_rememberMe = false;
  String _emailErrorMsg = "", _passwordErrorMsg="";

  SignInScreenBloc() : super(const SignInScreenState()) {
    on<PasswordVisibleEvent>(_onPasswordVisibleEvent);

    on<EmailValidationEvent>(_onEmailValidateEvent);

    on<PasswordValidationEvent>(_onPasswordValidateEvent);

    on<RememberMeEvent>(_onRememberMeEvent);

    on<SignInButtonEvent>(_onSignInButtonEvent);
  }

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
    } else if(!(RegexValidation.isEmail(emailEditingController.text))) {
      _emailErrorMsg = "Invalid email address";
    } else {
      _emailErrorMsg = "";
    }
    return _emailErrorMsg.isEmpty;
  }

  bool _validatePassword(){
    if(passwordEditingController.text.isEmpty){
      _passwordErrorMsg = "Password is required";
    } else if(passwordEditingController.text.length<8) {
      _passwordErrorMsg = "Password is too short";
    } else {
      _passwordErrorMsg = "";
    }
    return _passwordErrorMsg.isEmpty;
  }

  void _onPasswordValidateEvent(PasswordValidationEvent event, Emitter<SignInScreenState> emit){
    emit(
      state.copyWith(
        passwordErrorMsg: _validatePassword() ? "" : _passwordErrorMsg,
      ),
    );
  }

  void _onPasswordVisibleEvent(PasswordVisibleEvent event, Emitter<SignInScreenState> emit){
    _showPassword = !_showPassword;
    emit(
      state.copyWith(
        isPasswordVisible: _showPassword,
      ),
    );
  }

  void _onRememberMeEvent(RememberMeEvent event, Emitter<SignInScreenState> emit){
    _rememberMe = !_rememberMe;
    emit(
      state.copyWith(
        isRememberMe: _rememberMe,
      ),
    );
  }

  void _onEmailValidateEvent(EmailValidationEvent event, Emitter<SignInScreenState> emit){
    emit(
      state.copyWith(
        emailErrorMsg: _validateEmail() ? "" : _emailErrorMsg,
      ),
    );
  }

  void _onSignInButtonEvent(SignInButtonEvent event, Emitter<SignInScreenState> emit) async{
    if(_validateEmail() & _validatePassword()){
      emit(
        state.copyWith(
          isLoading: true,
        ),
      );
      dynamic result = await _userService.loginUser(
        email: emailEditingController.text,
        password: passwordEditingController.text,
      );
      emit(
        state.copyWith(
          isLoading: false,
        ),
      );
      if(result is UserModel){
        
      } else {
        floatingDialog(result, screenContext!,isErrorMessage: true,);
      }
    }else{
      emit(
        state.copyWith(
          passwordErrorMsg: _passwordErrorMsg,
          emailErrorMsg: _emailErrorMsg,
        ),
      );
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
