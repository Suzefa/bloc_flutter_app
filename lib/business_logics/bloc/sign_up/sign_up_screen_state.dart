part of 'sign_up_screen_bloc.dart';

class SignUpScreenState extends Equatable {
  final String firstNameErrorMsg;
  final String lastNameErrorMsg;
  final String fatherNameErrorMsg;
  final String emailErrorMsg;
  final String passwordErrorMsg;
  final String confirmPasswordErrorMsg;
  final bool hidePassword;
  final bool isLoading;

  const SignUpScreenState({
    this.firstNameErrorMsg = "",
    this.lastNameErrorMsg = "",
    this.fatherNameErrorMsg = "",
    this.emailErrorMsg = "",
    this.passwordErrorMsg = "",
    this.confirmPasswordErrorMsg = "",
    this.hidePassword = true,
    this.isLoading = false,
  });

  SignUpScreenState updateStateWith({
    String? firstNameErrorMsg,
    String? lastNameErrorMsg,
    String? fatherNameErrorMsg,
    String? emailErrorMsg,
    String? passwordErrorMsg,
    String? confirmPasswordErrorMsg,
    bool? hidePassword,
    bool? isLoading,
  }){
    return SignUpScreenState(
      firstNameErrorMsg: firstNameErrorMsg ?? this.firstNameErrorMsg,
      lastNameErrorMsg: lastNameErrorMsg ?? this.lastNameErrorMsg,
      fatherNameErrorMsg: fatherNameErrorMsg ?? this.fatherNameErrorMsg,
      emailErrorMsg: emailErrorMsg ?? this.emailErrorMsg,
      passwordErrorMsg: passwordErrorMsg ?? this.passwordErrorMsg,
      confirmPasswordErrorMsg: confirmPasswordErrorMsg ?? this.confirmPasswordErrorMsg,
      hidePassword: hidePassword ?? this.hidePassword,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  SignUpScreenState fromJson(Map<String,dynamic> json) {
    return SignUpScreenState(
      firstNameErrorMsg: json["firstNameErrorMsg"] ?? "",
      lastNameErrorMsg: json["lastNameErrorMsg"] ?? "",
      fatherNameErrorMsg: json["fatherNameErrorMsg"] ?? "",
      emailErrorMsg: json["emailErrorMsg"] ?? "",
      passwordErrorMsg: json["passwordErrorMsg"] ?? "",
      confirmPasswordErrorMsg: json["confirmPasswordErrorMsg"] ?? "",
      hidePassword: json["hidePassword"] ?? "",
      isLoading: json["isLoading"] ?? "",
    );
  }

  Map<String,dynamic> toJson(){
    return {
      "firstNameErrorMsg" : firstNameErrorMsg,
      "lastNameErrorMsg" : lastNameErrorMsg,
      "fatherNameErrorMsg" : fatherNameErrorMsg,
      "emailErrorMsg" : emailErrorMsg,
      "passwordErrorMsg" : passwordErrorMsg,
      "confirmPasswordErrorMsg" : confirmPasswordErrorMsg,
      "hidePassword" : hidePassword,
      "isLoading" : isLoading,
    };
  }


  @override
  String toString() {
    return 'SignUpScreenState{firstNameErrorMsg: $firstNameErrorMsg, lastNameErrorMsg: $lastNameErrorMsg, fatherNameErrorMsg: $fatherNameErrorMsg, emailErrorMsg: $emailErrorMsg, passwordErrorMsg: $passwordErrorMsg, confirmPasswordErrorMsg: $confirmPasswordErrorMsg, hidePassword: $hidePassword, isLoading: $isLoading}';
  }

  @override
  List<Object?> get props => [
    firstNameErrorMsg,
    lastNameErrorMsg,
    fatherNameErrorMsg,
    emailErrorMsg,
    passwordErrorMsg,
    confirmPasswordErrorMsg,
    hidePassword,
    isLoading,
  ];
}
