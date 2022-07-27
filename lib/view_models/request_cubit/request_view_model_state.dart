part of 'request_view_model_cubit.dart';

@immutable

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