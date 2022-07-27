
import 'package:petology/models/login_model.dart';

abstract class LoginStates{}

class LoginInitialState extends LoginStates {}

class LoginLoadingState extends LoginStates {}

class LoginSuccessState extends LoginStates
{
  final LoginModel loginModel;

  LoginSuccessState(this.loginModel);

}

class LoginErrorState extends LoginStates
{
  final String error;

  LoginErrorState(this.error);
}
class ChangePasswordV1State extends LoginStates {}
class ChangePasswordV2State extends LoginStates {}
class ChangePasswordV3State extends LoginStates {}


class ChangePasswordLoadingState extends LoginStates {}


class ChangePasswordSuccessState extends LoginStates {

/*  final LoginModel passwordModel;

  ChangePasswordSuccessState(this.passwordModel);*/
}

class ChangePasswordErrorState extends LoginStates {

  final String error;

  ChangePasswordErrorState(this.error);
}
class NewPasswordLoadingState extends LoginStates {}


class NewPasswordSuccessState extends LoginStates {
/*
  final LoginModel passwordModel;

  NewPasswordSuccessState(this.passwordModel);*/
}

class NewPasswordErrorState extends LoginStates {

  final String error;

  NewPasswordErrorState(this.error);
}

class HomeViewModelChangeScreenState extends LoginStates{}




