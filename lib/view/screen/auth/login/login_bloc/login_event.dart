part of 'login_bloc.dart';

abstract class UserAuthEvent extends Equatable {
  const UserAuthEvent();
}

class FetchLogin extends UserAuthEvent {
  const FetchLogin({this.email, this.password});
  final String? email;
  final String? password;
  @override
  List<Object?> get props => [email, password];
}

class FetchRegister extends UserAuthEvent {
  const FetchRegister({
    this.password,
    this.email,
    this.passwordConfirmation,
    this.phone,
  });
  final String? email;
  final String? password;
  final String? passwordConfirmation;
  final String? phone;
  @override
  List<Object?> get props => [
        email,
        password,
        phone,
        passwordConfirmation,
      ];
}

class FetchEmailRegister extends UserAuthEvent {
  const FetchEmailRegister({
    this.email,
  });
  final String? email;

  @override
  List<Object?> get props => [
        email,
      ];
}

class GoogleSignin extends UserAuthEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class FacebookSignin extends UserAuthEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class FacebookSignUp extends UserAuthEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class GoogleSignUp extends UserAuthEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class SignOut extends UserAuthEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
