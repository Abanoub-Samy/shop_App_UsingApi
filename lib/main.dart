import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_with_api/screens/login_screen.dart';
import 'package:shop_app_with_api/screens/onBoarding_screen.dart';
import 'package:shop_app_with_api/shared/cache_helper.dart';
import 'package:shop_app_with_api/shared/cubit/app_cubit.dart';
import 'package:shop_app_with_api/shared/cubit/app_states.dart';
import 'package:shop_app_with_api/shared/cubit/bloc_observer.dart';
import 'package:shop_app_with_api/shared/styles/themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  // DioHelper.init();
  await CacheHelper.init();
  bool? isDark = CacheHelper.getData('isDark');
  runApp(MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (BuildContext ctx) =>
                AppCubit()..changeAppMode(fromShared: isDark)),
      ],
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (ctx, state) {},
        builder: (ctx, state) {
          return MyApp(isDark!);
        },
      )));
}

class MyApp extends StatelessWidget {
  final bool isDark;

  MyApp(this.isDark);

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
      },
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              AppCubit.get(context).changeAppMode();
            },
            icon: AppCubit.get(context).isDark
                ? Icon(
                    Icons.brightness_4_outlined,
                    color: Colors.black,
                  )
                : Icon(
                    Icons.brightness_4_outlined,
                    color: Colors.white,
                  ),
          ),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(
                      context, LoginScreen.routeName);
                },
                child: Text(
                  'Skip',
                  style: TextStyle(
                    color: AppCubit.get(context).isDark
                        ? Colors.black
                        : Colors.white,
                  ),
                ))
          ],
        ),
        body: OnBoardingScreen(),
      ),
    );
  }
}
