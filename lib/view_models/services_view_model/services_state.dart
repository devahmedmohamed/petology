import 'package:petology/models/service_model.dart';

abstract class ServicesState {}

class ServicesInitial extends ServicesState {}

class ServicesLoadingState extends ServicesState{}

class ServicesSuccessState extends ServicesState{

  final ServicesModel sendFilterModel;

  ServicesSuccessState(this.sendFilterModel);
}
class ServicesErrorState extends ServicesState{
  final String error;

  ServicesErrorState(this.error);
}