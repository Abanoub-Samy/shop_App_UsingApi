import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_with_api/models/login_model.dart';
import 'package:shop_app_with_api/shared/cache_helper.dart';
import 'package:shop_app_with_api/shared/cubit/app_states.dart';
import 'package:shop_app_with_api/shared/dio_helper.dart';
import 'package:shop_app_with_api/shared/end_point.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(InitialState());

  static AppCubit get(context) => BlocProvider.of(context);
  bool isDark = false;
  LoginModel? loginModel ;


  void changeAppMode({bool? fromShared}) {
    if (fromShared != null)
      isDark = fromShared;
    else
      isDark = !isDark;
    CacheHelper.putData('isDark', isDark).then((value) {
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
      data: {
        'email': email,
        'password': password,
      },
    ).then((value){
      //print(value.toString());
      loginModel = LoginModel.fromJson(value.data);
      print(loginModel!.data!.email);
      emit(LoginSuccessState());
    }).catchError((onError){
      emit(LoginErrorState(onError.toString()));
      print(onError.toString());
    });
  }
}
