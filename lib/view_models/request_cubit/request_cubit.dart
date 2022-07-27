import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petology/models/pets_controller_create_model.dart';
import 'package:petology/shared/constants/constants.dart';
import 'package:petology/shared/constants/end_point.dart';
import 'package:petology/shared/network/remote/dio_helper.dart';
import 'package:petology/view_models/request_cubit/request_state.dart';



class RequestCubit extends Cubit<RequestStates> {
  RequestCubit() :super (RequestInitialState());

  static RequestCubit get(context) => BlocProvider.of(context);




  late PetsModel petsModel;
  void dogData({
    required String breed,
    required String name,
    required String phone,
    required String description,
    required String category,
    required String year,
    required String month,
    required String size,
    required String goodWith,
    required String gender,
    required String color,
    required String hairLength,
    required String careBehavior,
    required String houseTrained,
    required String location,




  }) {
    emit(RequestLoadingState());
    DioHelper.postData(
      url: CREATE,
      data: {
        'name': name,
        'year': year,
        'month': month,
        'size': size,
        'breed': breed,
        'gender': gender,
        'hairLength': hairLength,
        'color': color,
        'careBehavior': careBehavior,
        'houseTrained': houseTrained,
        'description':description,
        'location': location,
        'category': category,
        'phone': phone,



        'goodWith': goodWith,
      },
    ).then((value) {
      print(value.data);
      petsModel = PetsModel.fromJson(value.data);


      emit(RequestSuccessState(petsModel));
    }).catchError((error) {
      print(error.toString());
      emit(RequestErrorState(error.toString()));
    });
  }


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

  List<String> dogColor = [
    'Brown',
    'Dark chocolate',
    'Red',
    'Golden',
    'Yellow',
    'Cream',
    /*'Blue',
    'Kerry',
    'Blue',
    'Grey'*/
  ];
  String selectedDogColor = 'Brown';


  List<String> goodWith =[
    "PET FRIENDLY",
    "KID FRIENDLY",
    "DISABLED"
  ];
      String selectedGood = 'PET FRIENDLY';

  bool checkValue=false;
  void changeCheckBoxValue(){

    checkValue=!checkValue;
    emit(CheckBoxChangeState());

  }


  void changeScreen(int currentIndex)
  {

    index=currentIndex;

    emit(RequestChangeScreenState());
  }
}