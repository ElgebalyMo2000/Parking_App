
abstract class AppRegisterStates {}
class AppRegisterInitialState extends AppRegisterStates{}

class AppRegisterLoadingState extends AppRegisterStates{}

class AppRegisterSuccessState extends AppRegisterStates
{
}

class AppRegisterErrorState extends AppRegisterStates {
  late String error;

  AppRegisterErrorState(this.error);
}