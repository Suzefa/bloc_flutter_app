import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'sign_up_screen_event.dart';
part 'sign_up_screen_state.dart';

class SignUpScreenBloc extends Bloc<SignUpScreenEvent, SignUpScreenState> {
  SignUpScreenBloc() : super(SignUpScreenState()) {
    on<SignUpScreenEvent>((event, emit) {});
  }
}
