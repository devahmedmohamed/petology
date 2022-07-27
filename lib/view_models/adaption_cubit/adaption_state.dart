
import '../../models/filter_grid_model.dart';

abstract class AdaptionState {}

class AdaptionInitial extends AdaptionState {}

class FilterGridLoadingState extends AdaptionState{}
class FilterGridSuccessState extends AdaptionState{
  final FilterGridModel filterGridModel;

  FilterGridSuccessState(this.filterGridModel);
}
class FilterGridErrorState extends AdaptionState{
  final String error;

  FilterGridErrorState(this.error);
}

