import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../views/about_us_view.dart';
import '../../../views/adaption_view.dart';
import '../../../views/login_view.dart';
import '../../../views/request_view.dart';
import '../../../views/services_view.dart';
import '../../../views/sign_up_view.dart';
import '../../shared/constants/constants.dart';
import 'HomeViewModelState.dart';

class HomeViewModelCubit extends Cubit<HomeViewModelState> {
  HomeViewModelCubit() : super(HomeViewModelInitial());

  static HomeViewModelCubit get(context) => BlocProvider.of(context);

  var isHover = [false, false, false, false, false, false];

  List<Widget> screens = [
    AboutUSView(),
    AdaptionView(),
    ServicesView(),
    RequestView(),
    SignUpView(),
    LoginView(),
  ];


  void changeScreen(int currentIndex)
  {

    index=currentIndex;

    emit(HomeViewModelChangeScreenState());
  }


}
