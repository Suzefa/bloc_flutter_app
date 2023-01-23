part of 'sign_in_screen_bloc.dart';

class SignInScreenState extends Equatable {
  final Color? emailFieldColor;
  final Color? passwordFieldColor;
  final bool isPasswordFieldObscure;
  final bool isRememberMeEnable;
  final bool isLoading;
  final String emailErrorMessage;
  final String passwordErrorMessage;

  const SignInScreenState({
    this.isLoading=false,
    this.emailFieldColor,
    this.passwordFieldColor,
    this.isPasswordFieldObscure = true,
    this.isRememberMeEnable = false,
    this.emailErrorMessage = "",
    this.passwordErrorMessage = "",
  });

  SignInScreenState copyWith({
    bool? isLoading,
    bool? isPasswordVisible,
    bool? isRememberMe,
    Color? emailErrorColor,
    Color? passwordErrorColor,
    String? emailErrorMsg,
    String? passwordErrorMsg,
  }){
    return SignInScreenState(
      emailErrorMessage: emailErrorMsg ?? emailErrorMessage,
      passwordErrorMessage: passwordErrorMsg ?? passwordErrorMessage,
      isPasswordFieldObscure: isPasswordVisible ?? isPasswordFieldObscure,
      isRememberMeEnable: isRememberMe ?? isRememberMeEnable,
      emailFieldColor: emailErrorColor,
      passwordFieldColor: passwordErrorColor,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  SignInScreenState fromJson(Map<String,dynamic> json){
    return SignInScreenState(
      emailFieldColor: json["emailFieldColor"],
      emailErrorMessage: json["emailErrorMessage"] ?? "",
      passwordErrorMessage: json["passwordErrorMessage"] ?? "",
      passwordFieldColor: json["passwordFieldColor"],
      isRememberMeEnable: json["isRememberMeEnable"] ?? false,
      isPasswordFieldObscure: json["isPasswordFieldObscure"] ?? false,
      isLoading: json["isLoading"] ?? false,
    );
  }

  Map<String, dynamic> toJson(){
    return {
      "emailFieldColor" : emailFieldColor,
      "emailErrorMessage" : emailErrorMessage,
      "passwordErrorMessage" : passwordErrorMessage,
      "passwordFieldColor" : passwordFieldColor,
      "isRememberMeEnable" : isRememberMeEnable,
      "isPasswordFieldObscure" : isPasswordFieldObscure,
      "isLoading" : isLoading,
    };
  }


  @override
  String toString() {
    return 'SignInScreenState{emailFieldColor: $emailFieldColor, passwordFieldColor: $passwordFieldColor, isPasswordFieldObscure: $isPasswordFieldObscure, isRememberMeEnable: $isRememberMeEnable, isLoading: $isLoading, emailErrorMessage: $emailErrorMessage, passwordErrorMessage: $passwordErrorMessage}';
  }

  @override
  List<Object?> get props => [
    emailFieldColor,
    passwordFieldColor,
    isPasswordFieldObscure,
    isRememberMeEnable,
    emailErrorMessage,
    passwordErrorMessage,
    isLoading,
  ];
}
