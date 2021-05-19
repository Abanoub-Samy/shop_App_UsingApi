import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_with_api/shared/cache_helper.dart';
import 'package:shop_app_with_api/shared/cubit/app_states.dart';

class AppCubit extends Cubit<AppStates>{
  AppCubit() : super(InitialState());
  static AppCubit get(context) => BlocProvider.of(context);
  bool isDark = false;
  int currentIndex = 0;

  void changeAppMode({bool? fromShared}) {
    if (fromShared != null)
      isDark = fromShared;
    else
      isDark = !isDark;
    CacheHelper.putData('isDark', isDark).then((value) {
      emit(AppChangeMode());
    });
  }
}