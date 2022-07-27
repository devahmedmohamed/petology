import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../models/send_filter_model.dart';
import '../../shared/constants/end_point.dart';
import '../../shared/network/remote/dio_helper.dart';

part 'request_view_model_state.dart';

class RequestViewModelCubit extends Cubit<RequestViewModelState> {
  RequestViewModelCubit() : super(RequestViewModelInitial());

  static RequestViewModelCubit get(context) => BlocProvider.of(context);

  List<String> categories = ['Dogs', 'Cats'];
  String selectedCategory = 'Dogs';

  List<String> years = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
    '11',
    '12'
  ];
  String selectedYear = '1';

  List<String> months = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
    '11',
    '12'
  ];
  String selectedMonth = '1';

  List<String> sizes = ['Small', 'Medium', 'Large'];
  String selectedSize = 'Small';

  List<String> breeds = [
    'Dogo',
    'German',
    'Shepherd',
    'Great Dane',
    'Kangal',
    'Pitbull'
  ];
  String selectedBreed = 'German';

  List<String> genders = ['Male', 'Female'];
  String selectedGender = 'Male';

  List<String> hairLengths = ['Short', 'Medium', 'Tall'];
  String selectedHairLength = 'Short';

  List<String> behaviours = ['Outgoing', 'Shy', 'Bounded Pair', 'Blind'];
  String selectedBehaviour = 'Shy';

  List<String> houseTrained = ['Yes', 'No'];
  String selectedHouseTrained = 'Yes';

  List<String> colors = [
    'Brown',
    'Dark chocolate',
    'Red',
    'Golden',
    'Yellow',
    'Cream',
    'Blue',
    'Kerry',
    'Blue',
    'Grey'
  ];
  String selectedColor = 'Red';

  late SendFilterModel sendFilterModel;

  void dogData({
    required String breed,
    required String age,
    required String size,
    required String goodWith,
    required String gender,
    required String color,
    required String hairLength,
    required String behaviour,
  }) {
    emit(RequestLoadingState());
    DioHelper.postData(
      url: CREATE,
      data: {
        'breed': breed,
        'age': age,
        'size': size,
        'goodWith': goodWith,
        'gender': gender,
        'color': color,
        'hairLength': hairLength,
        'behaviour': behaviour,
      },
    ).then((value) {
      print(value.data);
      sendFilterModel = SendFilterModel.fromJson(value.data);

      emit(RequestSuccessState(sendFilterModel));
    }).catchError((error) {
      print(error.toString());
      emit(RequestErrorState(error.toString()));
    });
  }
}
