part of 'resetpass_bloc.dart';

abstract class ResetpassEvent extends Equatable {
  const ResetpassEvent();
}

class FetchResetPassword extends ResetpassEvent {
  const FetchResetPassword({this.email, this.newPass});
  final String? email;
  final String? newPass;

  @override
  List<Object?> get props => [email, newPass];
}
