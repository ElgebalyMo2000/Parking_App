import '../../../models/login_model.dart';

abstract class AppLoginStates {}

class AppLoginInitialState extends AppLoginStates{}

class AppLoginLoadingState extends AppLoginStates{}

class AppLoginSuccessState extends AppLoginStates{
   String? token;
   AppLoginSuccessState(this.token);
}

class AppLoginErrorState extends AppLoginStates
{
  final String error;
  AppLoginErrorState(this.error);
}
