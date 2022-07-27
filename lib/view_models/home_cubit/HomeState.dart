
import '../../models/footer_model.dart';

abstract class HomeState{}

class HomeViewModelInitial extends HomeState{}

class HomeViewModelChangeScreenState extends HomeState{}

class HomeFooterLoadingState extends HomeState{}
class HomeFooterSuccessState extends HomeState{
  final FooterModel footerModel;
  HomeFooterSuccessState(this.footerModel);
}
class HomeFooterErrorState extends HomeState{
  final String error;

  HomeFooterErrorState(this.error);
}