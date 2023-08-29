part of 'login_cubit.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class LoginInitialSucess extends LoginState {}

class SaveInfoLoginSuccess extends LoginState {
  bool isSaveInfoLogin;
  SaveInfoLoginSuccess(this.isSaveInfoLogin);
}

class TapObscureSuccess extends LoginState {
  bool isTapObscure;
  TapObscureSuccess(this.isTapObscure);
}

class LoginSuccess extends LoginState {}

class LoginFailed extends LoginState {
  final String? error;

  const LoginFailed({this.error});
}
