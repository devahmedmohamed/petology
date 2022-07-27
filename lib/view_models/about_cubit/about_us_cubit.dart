import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../models/about_model.dart';
import '../../shared/constants/constants.dart';
import '../../shared/constants/end_point.dart';
import '../../shared/network/remote/dio_helper.dart';

part 'about_us_state.dart';

class AboutUsCubit extends Cubit<AboutUsState> {
  AboutUsCubit() : super(AboutUsInitialState());

  static  AboutUsCubit get(context) => BlocProvider.of(context);

  void changeScreen(int currentIndex)
  {

    index=currentIndex;

    emit(ChangeScreenState());
  }
  late AboutsModel aboutsModel;


  Future getAboutData() async{
    emit(AboutUsLoadingState());

    await DioHelper.getData(
      url:About ,
      token: token,

    ).then((value) {
      aboutsModel = AboutsModel.fromJson(value.data);

      emit(AboutUsSuccessState(aboutsModel));
    }).catchError((error) {
      print(error.toString());
      emit(AboutUsErrorState(error.toString()));
    });
  }

}
