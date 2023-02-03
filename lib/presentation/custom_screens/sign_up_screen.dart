import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../business_logics/bloc/sign_up/sign_up_screen_bloc.dart';
import '../custom_widgets/custom_app_button.dart';
import '../custom_widgets/custom_check_box.dart';
import '../custom_widgets/custom_radio_button.dart';
import '../custom_widgets/custom_scaffold_before_login.dart';
import '../custom_widgets/custom_text_field.dart';
import '../custom_widgets/custom_text_widget.dart';
import '../utilities/color_constant.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SignUpScreenBloc signUpScreenBloc = BlocProvider.of<SignUpScreenBloc>(context);
    signUpScreenBloc.screenContext = context;
    return CustomScaffoldBeforeLogin(
      onScreenTap: signUpScreenBloc.removeFocus,
      child: SingleChildScrollView(
        // physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10.0,),
              child: Image.asset(
                "assets/icons/app-icon.png",
                height: 50,
                width: 50,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(
                top: 0.0,
              ),
              child: CustomTextWidget(
                text: "Sign Up",
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
                textColor: ColorConstant.kBlackColor,
              ),
            ),


            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: CustomTextWidget(
                  text: "First Name:",
                  fontSize: 18.0,
                ),
              ),
            ),
            BlocBuilder<SignUpScreenBloc, SignUpScreenState>(
              builder: (context,state){
                return CustomTextField(
                  borderColor: state.firstNameErrorMsg.isEmpty
                      ? null : ColorConstant.kRedColor,
                  isEnabled: !state.isLoading,
                  onInputText: (text){
                    signUpScreenBloc.add(FirstNameValidationEvent());
                  },
                  inputType: TextInputType.name,
                  inputAction: TextInputAction.next,
                  elevation: 0.0,
                  textEditingController: signUpScreenBloc.firstNameEditingController,
                  focusNode: signUpScreenBloc.firstNameNode,
                  hintText: "First Name",
                  prefixIcon: Icons.person_pin_sharp,
                );
              },
            ),
            BlocBuilder<SignUpScreenBloc, SignUpScreenState>(
              builder: (context,state){
                return Visibility(
                  visible: state.firstNameErrorMsg.isNotEmpty,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: CustomTextWidget(
                        text: state.firstNameErrorMsg,
                        textColor: ColorConstant.kRedColor,
                      ),
                    ),
                  ),
                );
              },
            ),

            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: CustomTextWidget(
                  text: "Last Name:",
                  fontSize: 18.0,
                ),
              ),
            ),
            BlocBuilder<SignUpScreenBloc, SignUpScreenState>(
              builder: (context,state){
                return CustomTextField(
                  borderColor: state.lastNameErrorMsg.isEmpty
                      ? null : ColorConstant.kRedColor,
                  isEnabled: !state.isLoading,
                  onInputText: (text){
                    signUpScreenBloc.add(LastNameValidationEvent());
                  },
                  inputType: TextInputType.name,
                  inputAction: TextInputAction.next,
                  elevation: 0.0,
                  textEditingController: signUpScreenBloc.lastNameEditingController,
                  focusNode: signUpScreenBloc.lastNameNode,
                  hintText: "Last Name",
                  prefixIcon: Icons.person_pin_sharp,
                );
              },
            ),
            BlocBuilder<SignUpScreenBloc, SignUpScreenState>(
              builder: (context,state){
                return Visibility(
                  visible: state.lastNameErrorMsg.isNotEmpty,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: CustomTextWidget(
                        text: state.lastNameErrorMsg,
                        textColor: ColorConstant.kRedColor,
                      ),
                    ),
                  ),
                );
              },
            ),


            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: CustomTextWidget(
                  text: "Father's/Spouse's Name:",
                  fontSize: 18.0,
                ),
              ),
            ),
            BlocBuilder<SignUpScreenBloc, SignUpScreenState>(
              builder: (context,state){
                return CustomTextField(
                  borderColor: state.fatherNameErrorMsg.isEmpty
                      ? null : ColorConstant.kRedColor,
                  isEnabled: !state.isLoading,
                  onInputText: (text){
                    signUpScreenBloc.add(FatherNameValidationEvent());
                  },
                  inputType: TextInputType.name,
                  inputAction: TextInputAction.next,
                  elevation: 0.0,
                  textEditingController: signUpScreenBloc.fatherNameEditingController,
                  focusNode: signUpScreenBloc.fatherNameNode,
                  hintText: "Father's/Spouse's Name",
                  prefixIcon: Icons.person_pin_sharp,
                );
              },
            ),
            BlocBuilder<SignUpScreenBloc, SignUpScreenState>(
              builder: (context,state){
                return Visibility(
                  visible: state.fatherNameErrorMsg.isNotEmpty,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: CustomTextWidget(
                        text: state.fatherNameErrorMsg,
                        textColor: ColorConstant.kRedColor,
                      ),
                    ),
                  ),
                );
              },
            ),

            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: CustomTextWidget(
                  text: "Email:",
                  fontSize: 18.0,
                ),
              ),
            ),
            BlocBuilder<SignUpScreenBloc, SignUpScreenState>(
              builder: (context,state){
                return CustomTextField(
                  borderColor: state.emailErrorMsg.isEmpty
                      ? null : ColorConstant.kRedColor,
                  isEnabled: !state.isLoading,
                  onInputText: (text){
                    signUpScreenBloc.add(EmailValidationEvent());
                  },
                  inputType: TextInputType.emailAddress,
                  inputAction: TextInputAction.next,
                  elevation: 0.0,
                  textEditingController: signUpScreenBloc.emailEditingController,
                  focusNode: signUpScreenBloc.emailNode,
                  hintText: "Email",
                  prefixIcon: Icons.alternate_email,
                );
              },
            ),
            BlocBuilder<SignUpScreenBloc, SignUpScreenState>(
              builder: (context,state){
                return Visibility(
                  visible: state.emailErrorMsg.isNotEmpty,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: CustomTextWidget(
                        text: state.emailErrorMsg,
                        textColor: ColorConstant.kRedColor,
                      ),
                    ),
                  ),
                );
              },
            ),

            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: CustomTextWidget(
                  text: "Password:",
                  fontSize: 18.0,
                ),
              ),
            ),
            BlocBuilder<SignUpScreenBloc, SignUpScreenState>(
              builder: (context,state){
                return CustomTextField(
                  borderColor: state.passwordErrorMsg.isEmpty
                      ? null : ColorConstant.kRedColor,
                  isEnabled: !state.isLoading,
                  onInputText: (text){
                    signUpScreenBloc.add(PasswordValidationEvent());
                  },
                  isObscure: state.hidePassword,
                  inputType: TextInputType.text,
                  inputAction: TextInputAction.next,
                  elevation: 0.0,
                  textEditingController: signUpScreenBloc.passwordEditingController,
                  focusNode: signUpScreenBloc.passwordNode,
                  hintText: "Password",
                  prefixIcon: Icons.lock,
                  suffixIcon: Builder(
                      builder: (context) {
                        return GestureDetector(
                          onTap: (){
                            signUpScreenBloc.add(ShowPasswordEvent());
                          },
                          child: BlocBuilder<SignUpScreenBloc, SignUpScreenState>(
                            builder: (context,state){
                              return Icon(
                                state.hidePassword
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                // Icons.visibility,
                                color: ColorConstant.kBlackColor,
                              );
                            },
                          ),
                        );
                      }
                  ),
                );
              },
            ),
            BlocBuilder<SignUpScreenBloc, SignUpScreenState>(
              builder: (context,state){
                return Visibility(
                  visible: state.passwordErrorMsg.isNotEmpty,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: CustomTextWidget(
                        text: state.passwordErrorMsg,
                        textColor: ColorConstant.kRedColor,
                      ),
                    ),
                  ),
                );
              },
            ),

            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: CustomTextWidget(
                  text: "Confirm Password:",
                  fontSize: 18.0,
                ),
              ),
            ),
            BlocBuilder<SignUpScreenBloc, SignUpScreenState>(
              builder: (context,state){
                return CustomTextField(
                  borderColor: state.confirmPasswordErrorMsg.isEmpty
                      ? null : ColorConstant.kRedColor,
                  isEnabled: !state.isLoading,
                  isObscure: state.hidePassword,
                  onInputText: (text){
                    signUpScreenBloc.add(ConfirmPasswordValidationEvent());
                  },
                  inputType: TextInputType.text,
                  inputAction: TextInputAction.done,
                  elevation: 0.0,
                  textEditingController: signUpScreenBloc.confirmPasswordEditingController,
                  focusNode: signUpScreenBloc.confirmPasswordNode,
                  hintText: "Confirm Password",
                  prefixIcon: Icons.lock,
                  suffixIcon: Builder(
                      builder: (context) {
                        return GestureDetector(
                          onTap: (){
                            signUpScreenBloc.add(ShowPasswordEvent());
                          },
                          child: BlocBuilder<SignUpScreenBloc, SignUpScreenState>(
                            builder: (context,state){
                              return Icon(
                                state.hidePassword
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: ColorConstant.kBlackColor,
                              );
                            },
                          ),
                        );
                      },
                  ),
                );
              },
            ),
            BlocBuilder<SignUpScreenBloc, SignUpScreenState>(
              builder: (context,state){
                return Visibility(
                  visible: state.confirmPasswordErrorMsg.isNotEmpty,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: CustomTextWidget(
                        text: state.confirmPasswordErrorMsg,
                        textColor: ColorConstant.kRedColor,
                      ),
                    ),
                  ),
                );
              },
            ),

            const Padding(
              padding: EdgeInsets.only(top: 10.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: CustomTextWidget(
                  text: "Gender:",
                  fontSize: 18.0,
                ),
              ),
            ),
            BlocBuilder<SignUpScreenBloc, SignUpScreenState>(
              builder: (context,state){
                return Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomRadioButton(
                      buttonTitle: "Male:",
                      gender: Gender.male,
                      selectedGender: state.selectedGender,
                      onTap: (){
                        signUpScreenBloc.add(
                          OnGenderChangeEvent(Gender.male),
                        );
                      },
                    ),
                    CustomRadioButton(
                      buttonTitle: "Female:",
                      gender: Gender.female,
                      selectedGender: state.selectedGender,
                      onTap: (){
                        signUpScreenBloc.add(
                          OnGenderChangeEvent(Gender.female),
                        );
                      },
                    ),
                    CustomRadioButton(
                      buttonTitle: "Other",
                      gender: Gender.other,
                      selectedGender: state.selectedGender,
                      onTap: (){
                        signUpScreenBloc.add(
                          OnGenderChangeEvent(Gender.other),
                        );
                      },
                    ),
                  ],
                );
              },
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BlocBuilder<SignUpScreenBloc,SignUpScreenState>(
                  builder: (context,state){
                    return CustomCheckBox(
                      checkBoxValue: state.isPrivacyPolicySelected,
                      onTap: (){
                        signUpScreenBloc.add(OnSelectPrivacyPolicyEvent());
                      },
                    );
                  },
                ),
                const CustomTextWidget(
                  text: "I've read and accept the ",
                  fontSize: 10.0,
                ),
                GestureDetector(
                  onTap: (){},
                  child: const CustomTextWidget(
                    textDecoration: TextDecoration.underline,
                    text: "privacy policy",
                    fontSize: 12.0,
                  ),
                ),
              ],
            ),
            BlocBuilder<SignUpScreenBloc, SignUpScreenState>(
              builder: (context,state){
                return Visibility(
                  visible: state.privacyPolicyErrorMsg.isNotEmpty,
                  child: CustomTextWidget(
                    text: state.privacyPolicyErrorMsg,
                    textColor: ColorConstant.kRedColor,
                  ),
                );
              },
            ),
            Padding(
                padding: const EdgeInsets.only(top: 20.0,bottom: 10.0,),
                child: BlocBuilder<SignUpScreenBloc,SignUpScreenState>(
                  builder: (context,state){
                    return CustomAppButton(
                      isLoading: state.isLoading,
                      buttonText: "Sign Up",
                      onButtonPressed: ()=>
                          signUpScreenBloc.add(OnButtonPressedEvent()),
                    );
                  },
                )
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const CustomTextWidget(
                  text: "Already have an account?",
                  fontSize: 12.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0,),
                  child: GestureDetector(
                    onTap: (){
                      Navigator.of(context).pop();
                    },
                    child: const CustomTextWidget(
                      text: "Sign Ip",
                      fontSize: 12.0,
                      textColor: ColorConstant.kPrimaryColor,
                      textDecoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
