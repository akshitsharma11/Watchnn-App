part of 'profile_bloc.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();
}

class ProfileInitial extends ProfileState {
  @override
  List<Object> get props => [];
}

class ProfileLoading extends ProfileState {
  @override
  List<Object?> get props => [];
}

class ProfileLoaded extends ProfileState {
  const ProfileLoaded();

  @override
  List<Object?> get props => [];
}

class ProfileError extends ProfileState {
  const ProfileError({this.errorMsg});
  final String? errorMsg;

  @override
  List<Object?> get props => [];
}
