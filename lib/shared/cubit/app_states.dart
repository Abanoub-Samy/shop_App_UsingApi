import 'package:shop_app_with_api/models/change_favorites_model.dart';

abstract class AppStates {}

class InitialState extends AppStates {}

class AppChangeMode extends AppStates {}

class ChangeBottomNavState extends AppStates {}

class LoginLoadingState extends AppStates {}

class LoginSuccessState extends AppStates {}

class LoginErrorState extends AppStates {
  final String error;

  LoginErrorState(this.error);
}

class RegisterState extends AppStates {}

class HomeLoadingState extends AppStates {}

class HomeSuccessState extends AppStates {}

class HomeErrorState extends AppStates {
  final String error;

  HomeErrorState(this.error);
}

class CategoriesLoadingState extends AppStates {}

class CategoriesSuccessState extends AppStates {}

class CategoriesErrorState extends AppStates {
  final String error;

  CategoriesErrorState(this.error);
}

class FavoritesSuccessState extends AppStates {
  final ChangeFavoritesModel favoritesModel;

  FavoritesSuccessState(this.favoritesModel);
}

class FavoritesErrorState extends AppStates {
  final String error;

  FavoritesErrorState(this.error);
}

class FavoritesChangeState extends AppStates {}

class FavoritesChange extends AppStates {}

class GetFavoritesLoadingState extends AppStates {}

class GetFavoritesSuccessState extends AppStates {}

class GetFavoritesErrorState extends AppStates {
  final String error;

  GetFavoritesErrorState(this.error);
}

class GetProfileLoadingState extends AppStates {}

class GetProfileSuccessState extends AppStates {}

class GetProfileErrorState extends AppStates {
  final String error;

  GetProfileErrorState(this.error);
}
