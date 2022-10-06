import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:watchn/repository/auth_repository.dart';

part 'resetpass_event.dart';
part 'resetpass_state.dart';

class ResetpassBloc extends Bloc<ResetpassEvent, ResetpassState> {
  ResetpassBloc() : super(ResetpassInitial()) {
    on<ResetpassEvent>((event, emit) async {
      if (event is FetchResetPassword) {
        emit(ResetpassLoading());
        try {
          final res = await AuthRepository.updatePassword(
              email: event.email, newPassword: event.newPass);
          if (json.decode(res)['message'] != null) {
            emit(const ResetpassLoaded());
          } else {
            emit(const ResetpassError(errorMsg: 'An Unknown Erorr Occured!'));
          }
        } catch (e) {
          print(e);
          emit(const ResetpassError(errorMsg: 'AN UNKNOWN ERROR OCCURED!'));
        }
      }
    });
  }
}
