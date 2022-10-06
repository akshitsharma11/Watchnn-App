import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watchn/repository/auth_repository.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileInitial()) {
    on<ProfileEvent>((event, emit) async {
      if (event is GetProfile) {
        emit(ProfileLoading());
        try {
          final data = await AuthRepository.getUserProfile();
          print("${json.decode(data)['status']}");
          if (json.decode(data)['status'] == true) {
            emit(const ProfileLoaded());
          } else {
            emit(ProfileError(errorMsg: json.decode(data)['description']));
          }
        } catch (e) {
          emit(const ProfileError(errorMsg: 'AN UNKNOWN ERROR OCCURRED!'));
        }
      }
    });
  }
}
