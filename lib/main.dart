import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_with_api/screens/home_screen.dart';
import 'package:shop_app_with_api/screens/login_screen.dart';
import 'package:shop_app_with_api/screens/onBoarding_screen.dart';
import 'package:shop_app_with_api/screens/search_screen.dart';
import 'package:shop_app_with_api/screens/sign_up_screen.dart';
import 'package:shop_app_with_api/shared/cache_helper.dart';
import 'package:shop_app_with_api/shared/constants.dart';
import 'package:shop_app_with_api/shared/cubit/app_cubit.dart';
import 'package:shop_app_with_api/shared/cubit/app_states.dart';
import 'package:shop_app_with_api/shared/cubit/bloc_observer.dart';
import 'package:shop_app_with_api/shared/dio_helper.dart';
import 'package:shop_app_with_api/shared/styles/themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();
  bool isDark = CacheHelper.getData(key: 'isDark');
  bool onBoarding = CacheHelper.getData(key: 'onBoarding');
  token = CacheHelper.getData(key: 'token');
  Widget widget;
  if (onBoarding != null) {
    if (token != null) {
      widget = HomeScreen();
    } else {
      widget = LoginScreen();
    }
  } else {
    widget = OnBoardingScreen();
  }
  runApp(MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (BuildContext ctx) => AppCubit()
              ..changeAppMode(fromShared: isDark)..getHomeData()..getCategoriesData()),
      ],
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (ctx, state) {},
        builder: (ctx, state) {
          return MyApp(isDark, widget);
        },
      )));
}

class MyApp extends StatelessWidget {
  final bool isDark;
  final Widget widget;

  MyApp(this.isDark, this.widget);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode:
          AppCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
      routes: {
        LoginScreen.routeName: (ctx) => LoginScreen(),
        SignUpScreen.routeName: (ctx) => SignUpScreen(),
        HomeScreen.routeName: (ctx) => HomeScreen(),
        SearchScreen.routeName: (ctx) => SearchScreen(),
      },
      home: widget,
    );
  }
}
