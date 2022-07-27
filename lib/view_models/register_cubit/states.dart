
import 'package:petology/models/login_model.dart';

abstract class RegisterStates{}

class RegisterInitialState extends RegisterStates {}

class RegisterLoadingState extends RegisterStates {}

class RegisterSuccessState extends RegisterStates
{
  final LoginModel loginModel;

  RegisterSuccessState(this.loginModel);

}

class RegisterErrorState extends RegisterStates
{
  final String error;

  RegisterErrorState(this.error);
}
class ChangePasswordVState extends RegisterStates {}
class ChangePasswordV2State extends RegisterStates {}

class SendOTPLoadingState extends RegisterStates {}

class SendOTPSuccessState extends RegisterStates
{
  final LoginModel loginModel;

  SendOTPSuccessState(this.loginModel);

}

class SendOTPErrorState extends RegisterStates
{
  final String error;

  SendOTPErrorState(this.error);
}

class HomeViewModelChangeScreenState extends RegisterStates{}
