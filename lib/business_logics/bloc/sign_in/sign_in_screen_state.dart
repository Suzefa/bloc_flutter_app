part of 'sign_in_screen_bloc.dart';

class SignInScreenState extends Equatable {
  final bool isPasswordFieldObscure;
  final bool isRememberMeEnable;
  final bool isLoading;
  final String emailErrorMessage;
  final String passwordErrorMessage;

  const SignInScreenState({
    this.isLoading=false,
    this.isPasswordFieldObscure = true,
    this.isRememberMeEnable = false,
    this.emailErrorMessage = "",
    this.passwordErrorMessage = "",
  });

  SignInScreenState copyWith({
    bool? isLoading,
    bool? isPasswordVisible,
    bool? isRememberMe,
    String? emailErrorMsg,
    String? passwordErrorMsg,
  }){
    return SignInScreenState(
      emailErrorMessage: emailErrorMsg ?? emailErrorMessage,
      passwordErrorMessage: passwordErrorMsg ?? passwordErrorMessage,
      isPasswordFieldObscure: isPasswordVisible ?? isPasswordFieldObscure,
      isRememberMeEnable: isRememberMe ?? isRememberMeEnable,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  SignInScreenState fromJson(Map<String,dynamic> json){
    return SignInScreenState(
      emailErrorMessage: json["emailErrorMessage"] ?? "",
      passwordErrorMessage: json["passwordErrorMessage"] ?? "",
      isRememberMeEnable: json["isRememberMeEnable"] ?? false,
      isPasswordFieldObscure: json["isPasswordFieldObscure"] ?? false,
      isLoading: json["isLoading"] ?? false,
    );
  }

  Map<String, dynamic> toJson(){
    return {
      "emailErrorMessage" : emailErrorMessage,
      "passwordErrorMessage" : passwordErrorMessage,
      "isRememberMeEnable" : isRememberMeEnable,
      "isPasswordFieldObscure" : isPasswordFieldObscure,
      "isLoading" : isLoading,
    };
  }


  @override
  String toString() {
    return 'SignInScreenState{isPasswordFieldObscure: $isPasswordFieldObscure, isRememberMeEnable: $isRememberMeEnable, isLoading: $isLoading, emailErrorMessage: $emailErrorMessage, passwordErrorMessage: $passwordErrorMessage}';
  }

  @override
  List<Object?> get props => [
    isPasswordFieldObscure,
    isRememberMeEnable,
    emailErrorMessage,
    passwordErrorMessage,
    isLoading,
  ];
}
