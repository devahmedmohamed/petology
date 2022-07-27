import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../shared/constants/constants.dart';
import '../../../shared/constants/end_point.dart';
import '../../../shared/network/remote/dio_helper.dart';
import '../../models/login_model.dart';
import 'states.dart';



class RegisterCubit extends Cubit<RegisterStates>
{
  RegisterCubit(): super(RegisterInitialState());

  static  RegisterCubit get(context) => BlocProvider.of(context);

  LoginModel? loginModel;


  void userRegister({
    required String email,
    required String password,
    required String firstname,
    required String lastname,
    required String  phoneNumber,
    required String  country,


  })
  {
    emit(RegisterLoadingState());
    DioHelper.postData(
        url: REGISTER,
        data:{
          'email':email,
          'password':password,
          'firstName':firstname,
          'lastName':lastname,
          'phoneNumber':phoneNumber,
          'country':country,

        },
    ).then((value) {
      print(value.data);
      loginModel= LoginModel.fromJson(value.data);
      emit(RegisterSuccessState(loginModel!));
    }).catchError((error){
      print(error.toString());
      emit(RegisterErrorState(error.toString()));
    });
  }
  IconData suffix = Icons.visibility_outlined;
  bool isPassword =true;

  void changePasswordVisibility()
  {
    isPassword= !isPassword;
    suffix =isPassword? Icons.visibility_outlined:Icons.visibility_off_outlined;
    emit(ChangePasswordVState());
  }
  IconData suffx = Icons.visibility_outlined;
  bool inPassword =true;

  void changePasswordVisibility2()
  {
    inPassword= !inPassword;
    suffx =inPassword? Icons.visibility_outlined:Icons.visibility_off_outlined;
    emit(ChangePasswordV2State());
  }


  void changeScreen(int currentIndex)
  {

    index=currentIndex;

    emit(HomeViewModelChangeScreenState());
  }



}
