part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeChangeIndicatorIndexState extends HomeState {}

class HomeChangePageIndexState extends HomeState {}

class HomeGetTokensLoadingState extends HomeState {}

class HomeGetTokensSuccessState extends HomeState {}

class HomeGetTokensErrorState extends HomeState {}

class HomeGetHomePageDataLoadingState extends HomeState {}

class HomeGetHomePageDataSuccessState extends HomeState {
  final HomePageApiSuccessModel homePageApiModel;

  HomeGetHomePageDataSuccessState(this.homePageApiModel);
}

class HomeGetHomePageDataErrorState extends HomeState {
  final HomePageApiErrorModel homePageApiErrorModel;

  HomeGetHomePageDataErrorState(this.homePageApiErrorModel);
}
class HomeGetHomePageDataError404State extends HomeState {
  final HomePageApiError400Model homePageApiError404Model;

  HomeGetHomePageDataError404State(this.homePageApiError404Model);
}
