part of 'login_bloc.dart';

abstract class UserAuthState extends Equatable {
  const UserAuthState();
  @override
  List<Object?> get props => [];
}

class UserAuthInitial extends UserAuthState {
  @override
  List<Object> get props => [];
}

class UserLoading extends UserAuthState {}

class UserLoaded extends UserAuthState {
  const UserLoaded();
}

class EmailRegisterLoadded extends UserAuthState {
  final int? otp;
  const EmailRegisterLoadded({this.otp});
}

class UserError extends UserAuthState {
  const UserError({this.errorMsg});
  final String? errorMsg;
}
