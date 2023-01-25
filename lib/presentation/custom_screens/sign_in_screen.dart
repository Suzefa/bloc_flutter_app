import 'package:example_project/business_logics/bloc/sign_in/sign_in_screen_bloc.dart';
import 'package:example_project/presentation/custom_widgets/custom_app_button.dart';
import 'package:example_project/presentation/custom_widgets/custom_scaffold_before_login.dart';
import 'package:example_project/presentation/custom_widgets/custom_text_field.dart';
import 'package:example_project/presentation/custom_widgets/custom_text_widget.dart';
import 'package:example_project/presentation/route_management/route_names.dart';
import 'package:example_project/presentation/utilities/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SignInScreenBloc signInScreenBloc = context.watch<SignInScreenBloc>();
    return CustomScaffoldBeforeLogin(
      onScreenTap: signInScreenBloc.removeFocus,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
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
                text: "Sign In",
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
                  text: "Email:",
                  fontSize: 18.0,
                ),
              ),
            ),
            BlocBuilder<SignInScreenBloc,SignInScreenState>(
              builder: (context, state){
                return CustomTextField(
                  isEnabled: !state.isLoading,
                  borderColor: state.emailErrorMessage.isNotEmpty
                      ? ColorConstant.kRedColor : null,
                  onInputText: (value){
                    signInScreenBloc.add(EmailValidationEvent());
                  },
                  hintText: "Email",
                  prefixIcon: Icons.email,
                  inputType: TextInputType.emailAddress,
                  inputAction: TextInputAction.next,
                  elevation: 0.0,
                  textEditingController: signInScreenBloc.emailEditingController,
                  focusNode: signInScreenBloc.emailFocusNode,
                );
              },
            ),
            BlocBuilder<SignInScreenBloc,SignInScreenState>(
              builder: (context, state){
                return Visibility(
                  visible: state.emailErrorMessage.isNotEmpty,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: CustomTextWidget(
                        text: state.emailErrorMessage,
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
            BlocBuilder<SignInScreenBloc,SignInScreenState>(
              builder: (context, state) {
                return CustomTextField(
                  isEnabled: !state.isLoading,
                  borderColor: state.passwordErrorMessage.isNotEmpty
                      ? ColorConstant.kRedColor : null,
                  onInputText: (text){
                    signInScreenBloc.add(PasswordValidationEvent());
                  },
                  isObscure: state.isPasswordFieldObscure,
                  hintText: "Password",
                  prefixIcon: Icons.lock,
                  suffixIcon: Builder(
                      builder: (context) {
                        return GestureDetector(
                          onTap: (){
                            signInScreenBloc.add(PasswordVisibleEvent());
                          },
                          child: Icon(
                            state.isPasswordFieldObscure
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: ColorConstant.kBlackColor,
                          ),
                        );
                      }
                  ),
                  inputType: TextInputType.visiblePassword,
                  inputAction: TextInputAction.done,
                  elevation: 0.0,
                  textEditingController: signInScreenBloc.passwordEditingController,
                  focusNode: signInScreenBloc.passwordFocusNode,
                );
              },
            ),
            BlocBuilder<SignInScreenBloc,SignInScreenState>(
              builder: (context, state){
                return Visibility(
                  visible: state.passwordErrorMessage.isNotEmpty,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: CustomTextWidget(
                        text: state.passwordErrorMessage,
                        textColor: ColorConstant.kRedColor,
                      ),
                    ),
                  ),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Align(
                alignment: Alignment.centerRight,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const CustomTextWidget(
                      text: "remember me",
                      fontSize: 14.0,
                    ),
                    BlocBuilder<SignInScreenBloc, SignInScreenState>(
                      builder: (context, state){
                        return Padding(
                          padding: const EdgeInsets.only(left: 5.0,),
                          child: SizedBox(
                            height: 25.0,
                            width: 25.0,
                            child: Checkbox(
                              activeColor: ColorConstant.kBlackColor,
                              value: state.isRememberMeEnable,
                              onChanged: (v) {
                                if(state.isLoading){
                                  return;
                                }
                                signInScreenBloc.add(RememberMeEvent());
                              },
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(top: 20.0,bottom: 10.0,),
                child: BlocBuilder<SignInScreenBloc,SignInScreenState>(
                  builder: (context,state){
                    return CustomAppButton(
                      isLoading: state.isLoading,
                      buttonText: "Sign In",
                      onButtonPressed: ()=>
                          signInScreenBloc.add(SignInButtonEvent()),
                    );
                  },
                )
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const CustomTextWidget(
                  text: "Don't have an account?",
                  fontSize: 12.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0,),
                  child: GestureDetector(
                    onTap: (){
                      Navigator.of(context).pushNamed(RouteNames.kSignUpScreenRoute);
                    },
                    child: const CustomTextWidget(
                      text: "Sign Up",
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
