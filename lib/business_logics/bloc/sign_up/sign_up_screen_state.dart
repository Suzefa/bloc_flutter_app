part of 'sign_up_screen_bloc.dart';

class SignUpScreenState extends Equatable {
  final String firstNameErrorMsg;
  final String lastNameErrorMsg;
  final String fatherNameErrorMsg;
  final String emailErrorMsg;
  final String passwordErrorMsg;
  final String confirmPasswordErrorMsg;
  final String privacyPolicyErrorMsg;
  final bool hidePassword;
  final bool isLoading;
  final bool isPrivacyPolicySelected;
  final Gender selectedGender;

  const SignUpScreenState({
    this.firstNameErrorMsg = "",
    this.lastNameErrorMsg = "",
    this.fatherNameErrorMsg = "",
    this.emailErrorMsg = "",
    this.passwordErrorMsg = "",
    this.confirmPasswordErrorMsg = "",
    this.hidePassword = true,
    this.isLoading = false,
    this.selectedGender = Gender.male,
    this.privacyPolicyErrorMsg = "",
    this.isPrivacyPolicySelected = false,
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
    bool? isPrivacyPolicySelected,
    Gender? selectedGender,
    String? privacyPolicyErrorMsg,
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
      selectedGender: selectedGender ?? this.selectedGender,
      privacyPolicyErrorMsg: privacyPolicyErrorMsg ?? this.privacyPolicyErrorMsg,
      isPrivacyPolicySelected: isPrivacyPolicySelected ?? this.isPrivacyPolicySelected,
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
      selectedGender: json["selectedGender"] ?? "",
      privacyPolicyErrorMsg: json["privacyPolicyErrorMsg"] ?? "",
      isPrivacyPolicySelected: json["isPrivacyPolicySelected"] ?? "",
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
      "selectedGender" : selectedGender,
      "privacyPolicyErrorMsg" : privacyPolicyErrorMsg,
      "isPrivacyPolicySelected" : isPrivacyPolicySelected,
    };
  }


  @override
  String toString() {
    return 'SignUpScreenState{firstNameErrorMsg: $firstNameErrorMsg, lastNameErrorMsg: $lastNameErrorMsg, fatherNameErrorMsg: $fatherNameErrorMsg, emailErrorMsg: $emailErrorMsg, passwordErrorMsg: $passwordErrorMsg, confirmPasswordErrorMsg: $confirmPasswordErrorMsg, hidePassword: $hidePassword, isLoading: $isLoading, selectedGender: $selectedGender, privacyPolicyErrorMsg: $privacyPolicyErrorMsg, isPrivacyPolicySelected: $isPrivacyPolicySelected}';
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
    selectedGender,
    privacyPolicyErrorMsg,
    isPrivacyPolicySelected,
  ];
}
