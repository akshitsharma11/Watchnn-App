part of 'forgot_pass_bloc.dart';

abstract class ForgotAuthEvent extends Equatable {
  const ForgotAuthEvent();
}

class FetchEmailForgot extends ForgotAuthEvent {
  const FetchEmailForgot({this.email});
  final String? email;

  @override
  List<Object?> get props => [email];
}
