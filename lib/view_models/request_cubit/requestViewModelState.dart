import 'package:petology/models/sendFilterModel.dart';

abstract class RequestViewModelState{}


class RequestViewModelInitial extends RequestViewModelState{}
class RequestLoadingState extends RequestViewModelState{}
class RequestSuccessState extends RequestViewModelState{

  final SendFilterModel sendFilterModel;

  RequestSuccessState(this.sendFilterModel);
}
class RequestErrorState extends RequestViewModelState{
  final String error;

  RequestErrorState(this.error);
}

class CheckBoxChangeState extends RequestViewModelState{}