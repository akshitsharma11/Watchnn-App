import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:watchn/repository/auth_repository.dart';

part 'forgot_pass_event.dart';
part 'forgot_pass_state.dart';

class ForgotPassBloc extends Bloc<ForgotAuthEvent, ForgotAuthState> {
  ForgotPassBloc() : super(ForgotAuthInitial()) {
    on<ForgotAuthEvent>((event, emit) async {
      if (event is FetchEmailForgot) {
        emit(ForgotLoading());
        try {
          final res = await AuthRepository.forgotPassword(
            email: event.email,
          );
          print('OTP SEND ====> ${res}');
          if (json.decode(res)['otp'] != null) {
            emit(ForgotLoaded(otp: json.decode(res)['otp']));
          } else {
            emit(ForgotError(errorMsg: json.decode(res)['description']));
          }
        } catch (e) {
          print(e);
          emit(const ForgotError(errorMsg: 'AN UNKNOWN ERROR OCCURED!'));
        }
      }
    });
  }
}
