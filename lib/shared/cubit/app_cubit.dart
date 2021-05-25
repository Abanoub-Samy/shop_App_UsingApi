import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_with_api/models/categories_model.dart';
import 'package:shop_app_with_api/models/change_favorites_model.dart';
import 'package:shop_app_with_api/models/favorites_model.dart';
import 'package:shop_app_with_api/models/home_models.dart';
import 'package:shop_app_with_api/models/login_model.dart';
import 'package:shop_app_with_api/screens/categories_screen.dart';
import 'package:shop_app_with_api/screens/favorites_screen.dart';
import 'package:shop_app_with_api/screens/products_screen.dart';
import 'package:shop_app_with_api/screens/settings_screen.dart';
import 'package:shop_app_with_api/shared/cache_helper.dart';
import 'package:shop_app_with_api/shared/constants.dart';
import 'package:shop_app_with_api/shared/cubit/app_states.dart';
import 'package:shop_app_with_api/shared/dio_helper.dart';
import 'package:shop_app_with_api/shared/end_point.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(InitialState());

  static AppCubit get(context) => BlocProvider.of(context);
  bool isDark = false;
  LoginModel? loginModel;

  int currentIndex = 0;
  List<Widget> screens = [
    ProductsScreen(),
    CategoriesScreen(),
    FavoritesScreen(),
    SettingsScreen(),
  ];

  void changeBottom(int index) {
    currentIndex = index;
    emit(ChangeBottomNavState());
  }

  void changeAppMode({bool? fromShared}) {
    if (fromShared != null)
      isDark = fromShared;
    else
      isDark = !isDark;
    CacheHelper.saveData(key: 'isDark', value: isDark).then((value) {
      emit(AppChangeMode());
    });
  }

  void userLogin({
    required String email,
    required String password,
  }) {
    emit(LoginLoadingState());
    DioHelper.postDate(
      url: Login,
      token: Token,
      data: {
        'email': email,
        'password': password,
      },
    ).then((value) {
      loginModel = LoginModel.fromJson(value.data);
      //print(loginModel!.data!.email);
      emit(LoginSuccessState());
    }).catchError((onError) {
      emit(LoginErrorState(onError.toString()));
      print(onError.toString());
    });
  }

  HomeModel? homeModel;
  Map<int?, bool> favorites = {};

  void getHomeData() {
    emit(HomeLoadingState());
    DioHelper.getDate(
      url: Home,
      token: Token,
    ).then((value) {
      homeModel = HomeModel.fromJson(value.data);
      //print(homeModel!.status.toString());
      homeModel!.data!.products!.forEach((element) {
        favorites.addAll({element.id: element.inFavorites});
        //print(favorites);
      });
      print('good');
      emit(HomeSuccessState());
    }).catchError((onError) {
      emit(HomeErrorState(onError.toString()));
      print(onError.toString());
    });
  }

  CategoriesModel? categoriesModel;

  void getCategoriesData() {
    emit(CategoriesLoadingState());
    DioHelper.getDate(
      url: Categories,
      token: Token,
    ).then((value) {
      categoriesModel = CategoriesModel.fromJson(value.data);
      //print(categoriesModel!.status.toString());
      emit(CategoriesSuccessState());
    }).catchError((onError) {
      emit(CategoriesErrorState(onError.toString()));
      print(onError.toString());
    });
  }

  ChangeFavoritesModel? changeFavoritesModel;
  void changeFavorites(int? productId) {
    if(favorites[productId]== true){
      favorites[productId] = false ;
      //getFavoritesData();
    }else {
      favorites[productId] = true ;
      //getFavoritesData();
    }
    emit(FavoritesChange());
    DioHelper.postDate(
            url: Favorites,
            data: {
              'product_id': productId,
            },
            token: Token)
        .then((value) {
      changeFavoritesModel = ChangeFavoritesModel.fromJson(value.data);
      emit(FavoritesSuccessState(changeFavoritesModel!));
      if(changeFavoritesModel!.status ==false){
        if(favorites[productId]== true){
          favorites[productId] = false ;
        }else {
          favorites[productId] = true ;
        }
      }
      emit(FavoritesChangeState());
    }).catchError((onError) {
      if(favorites[productId]== true){
        favorites[productId] = false ;
      }else {
        favorites[productId] = true ;
      }
      emit(FavoritesErrorState(onError.toString()));
      print(onError.toString());
    });
  }

  FavoritesModel? favoritesModel;

  void getFavoritesData() {
    emit(GetFavoritesLoadingState());
    DioHelper.getDate(
      url: Favorites,
      token: Token,
    ).then((value) {
      favoritesModel = FavoritesModel.fromJson(value.data);
      //print(categoriesModel!.status.toString());
      emit(GetFavoritesSuccessState());
    }).catchError((onError) {
      emit(GetFavoritesErrorState(onError.toString()));
      print(onError.toString());
    });
  }
}
