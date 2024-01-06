// part of 'login_cubit.dart';


// @immutable


// sealed class LoginState {}


// final class LoginInitial extends LoginState {}


import '../../../../models/loginModel.dart';


abstract class LoginStates {}


class LoginInitialState extends LoginStates {}


class LoginLoadingState extends LoginStates {}


class LoginErrorState extends LoginStates {
  final String error;
  LoginErrorState(this.error);
}

class LoginSuccessState extends LoginStates {
  final LoginModel? loginModel;
  LoginSuccessState({this.loginModel});
}


class ChangePasswordVisibilityState extends LoginStates {}

