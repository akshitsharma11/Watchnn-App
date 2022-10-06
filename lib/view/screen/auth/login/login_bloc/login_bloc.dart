import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:watchn/core/constant/local_key.dart';
import 'package:watchn/data/data_providers/data_provider.dart';
import 'package:watchn/repository/auth_repository.dart';

part 'login_event.dart';
part 'login_state.dart';

class UserAuthBloc extends Bloc<UserAuthEvent, UserAuthState> {
  UserAuthBloc() : super(UserAuthInitial()) {
    on<UserAuthEvent>((event, emit) async {
      if (event is FetchLogin) {
        emit(UserLoading());
        try {
          final data = await AuthRepository.userLogin(
              email: event.email, password: event.password);
          if (json.decode(data)['status'] == true) {
            print('RESPONSE => $data');
            await MyHydratedStorage()
                .write(LocalStorageKeys.userAuthentication, data);
            emit(const UserLoaded());
          } else {
            emit(UserError(errorMsg: json.decode(data)['description']));
          }
        } catch (e) {
          print(e);
          emit(const UserError(errorMsg: 'Error in SignIn'));
        }
      } else if (event is FetchRegister) {
        emit(UserLoading());
        try {
          final data = await AuthRepository.userRegister(
            email: event.email,
            password: event.password,
            password_confirmation: event.passwordConfirmation,
            phone: event.phone,
          );
          if (json.decode(data)['status'] == true) {
            await MyHydratedStorage()
                .write(LocalStorageKeys.userAuthentication, data);
            emit(const UserLoaded());
          } else {
            emit(const UserError(errorMsg: 'An Unknown Error Occurred!'));
          }
        } catch (e) {
          print(e);
          emit(const UserError(errorMsg: 'AN UNKNOWN ERROR OCCURRED!'));
        }
      } else if (event is FetchEmailRegister) {
        emit(UserLoading());
        // try {
        final data = await AuthRepository.emailRegister(
          email: event.email,
        );
        print('sf$data');
        if (json.decode(data)['otp'] != null) {
          emit(EmailRegisterLoadded(otp: json.decode(data)['otp']));
        } else {
          emit(UserError(errorMsg: json.decode(data)['message']));
        }
        // } catch (e) {
        //   print(e);
        //   emit(const UserError(errorMsg: 'AN UNKNOWN ERROR OCCURRED!'));
        // }
      } else if (event is GoogleSignin) {
        emit(UserLoading());
        try {
          final data = await AuthRepository.loginWithGoogle();
          if (json.decode(data)['status'] == true) {
            await MyHydratedStorage()
                .write(LocalStorageKeys.userAuthentication, data);
            emit(const UserLoaded());
          } else {
            emit(UserError(errorMsg: json.decode(data)['description']));
          }
        } catch (e) {
          emit(const UserError(errorMsg: 'Google authorization unsuccessful.'));
        }
      } else if (event is GoogleSignUp) {
        emit(UserLoading());
        try {
          final data = await AuthRepository.CreateAcWithGoogle();
          if (json.decode(data)['status'] == true) {
            await MyHydratedStorage()
                .write(LocalStorageKeys.userAuthentication, data);
            emit(const UserLoaded());
          } else {
            emit(UserError(errorMsg: json.decode(data)['description']));
          }
        } catch (e) {
          emit(const UserError(errorMsg: 'Google authorization unsuccessful.'));
        }
      } else if (event is SignOut) {
        final data = await AuthRepository.signOut();
        if (data == 1) {
          emit(const UserLoaded());
        } else {
          emit(const UserError(errorMsg: 'SignOut Error.'));
        }
      } else if (event is FacebookSignin) {
        emit(UserLoading());
        // try {
        final data = await AuthRepository.loginWithFacebook();
        if (json.decode(data)['status'] == true) {
          await MyHydratedStorage()
              .write(LocalStorageKeys.userAuthentication, data);
          emit(const UserLoaded());
        } else {
          emit(UserError(errorMsg: json.decode(data)['description']));
        }
        // } catch (e) {
        //   emit(const UserError(
        //       errorMsg: 'Facebook authorization unsuccessful.'));
        // }
      } else if (event is FacebookSignUp) {
        emit(UserLoading());
        try {
          final data = await AuthRepository.CreateAcWithFacebook();
          if (json.decode(data)['status'] == true) {
            await MyHydratedStorage()
                .write(LocalStorageKeys.userAuthentication, data);
            emit(const UserLoaded());
          } else {
            emit(UserError(errorMsg: json.decode(data)['description']));
          }
        } catch (e) {
          emit(const UserError(
              errorMsg: 'Facebook authorization unsuccessful.'));
        }
      }
    });
  }
}
