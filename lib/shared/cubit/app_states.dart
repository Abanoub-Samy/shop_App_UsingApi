abstract class AppStates{}
class InitialState extends AppStates {}
class AppChangeMode extends AppStates {}
class ChangeBottomNavState extends AppStates {}
class LoginLoadingState extends AppStates {}
class LoginSuccessState extends AppStates {}
class LoginErrorState extends AppStates {
  final String error ;

  LoginErrorState(this.error);
}
class RegisterState extends AppStates {}

class HomeLoadingState extends AppStates {}
class HomeSuccessState extends AppStates {}
class HomeErrorState extends AppStates {
  final String error ;

  HomeErrorState(this.error);
}

