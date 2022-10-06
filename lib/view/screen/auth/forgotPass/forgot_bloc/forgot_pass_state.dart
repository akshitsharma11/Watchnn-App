part of 'forgot_pass_bloc.dart';

abstract class ForgotAuthState extends Equatable {
  const ForgotAuthState();
  @override
  List<Object?> get props => [];
}

class ForgotAuthInitial extends ForgotAuthState {
  @override
  List<Object> get props => [];
}

class ForgotLoading extends ForgotAuthState {}

class ForgotLoaded extends ForgotAuthState {
  final int? otp;
  const ForgotLoaded({this.otp});
}

class ForgotError extends ForgotAuthState {
  const ForgotError({this.errorMsg});
  final String? errorMsg;
}
