abstract class AppStates{}
class InitialState extends AppStates {}
class AppChangeMode extends AppStates {}
class LoginLoadingState extends AppStates {}
class LoginSuccessState extends AppStates {}
class LoginErrorState extends AppStates {
  final String error ;

  LoginErrorState(this.error);
}
class RegisterState extends AppStates {}

