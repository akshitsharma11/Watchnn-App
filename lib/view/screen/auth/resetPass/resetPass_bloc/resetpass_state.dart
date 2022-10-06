part of 'resetpass_bloc.dart';

abstract class ResetpassState extends Equatable {
  const ResetpassState();
}

class ResetpassInitial extends ResetpassState {
  @override
  List<Object> get props => [];
}

class ResetpassLoading extends ResetpassState {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class ResetpassLoaded extends ResetpassState {
  const ResetpassLoaded();

  @override
  List<Object?> get props => [];
}

class ResetpassError extends ResetpassState {
  const ResetpassError({this.errorMsg});
  final String? errorMsg;

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
