import 'package:petology/models/pets_controller_create_model.dart';


abstract class RequestStates{}


class RequestInitialState extends RequestStates{}
class RequestLoadingState extends RequestStates{}
class RequestSuccessState extends RequestStates{

  final PetsModel petsModel;

  RequestSuccessState(this.petsModel);
}
class RequestErrorState extends RequestStates{
  final String error;

  RequestErrorState(this.error);
}
class RequestChangeScreenState extends RequestStates{}

class CheckBoxChangeState extends RequestStates{}





