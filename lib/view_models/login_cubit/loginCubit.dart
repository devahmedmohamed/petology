import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/loginModel.dart';
import '../../shared/constants/constants.dart';
import '../../shared/constants/end_point.dart';
import '../../shared/network/remote/dio_helper.dart';
import 'loginStates.dart';


class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() :super (LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);

  LoginModel ?loginModel;


  void userLogin({
    required String email,
    required String password,

  }) {
    emit(LoginLoadingState());
    DioHelper.postData(
      url: LOGIN,
      data: {
        'email': email,
        'password': password,
      },
    ).then((value) {
      print(value.data);
      loginModel = LoginModel.fromJson(value.data);


      emit(LoginSuccessState(loginModel!));
    }).catchError((error) {
      print(error.toString());
      emit(LoginErrorState(error.toString()));
    });
  }
  IconData suffix = Icons.visibility_outlined;
  bool isPassword =true;


  void changePasswordVisibility()
  {
    isPassword= !isPassword;
    suffix =isPassword? Icons.visibility_outlined:Icons.visibility_off_outlined;
    emit(ChangePasswordV1State());
  }

  IconData sufx = Icons.visibility_outlined;
  bool nPassword =true;
  void changePasswordVisibility3()
  {
    nPassword= !nPassword;
    sufx =nPassword? Icons.visibility_outlined:Icons.visibility_off_outlined;
    emit(ChangePasswordV3State());
  }


  IconData suffiix = Icons.visibility_outlined;
  bool cPassword =true;
  void changePasswordVisibility2()
  {
    cPassword= !cPassword;
    suffiix =cPassword? Icons.visibility_outlined:Icons.visibility_off_outlined;
    emit(ChangePasswordV2State());
  }

  void changeScreen(int currentIndex)
  {

    index=currentIndex;

    emit(HomeViewModelChangeScreenState());
  }
}