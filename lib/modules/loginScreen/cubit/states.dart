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

class AppGetUserLoadingState extends AppLoginStates {}

class AppGetUserSuccessState extends AppLoginStates {}

class AppGetUserErrorState extends AppLoginStates {
  final String error;

  AppGetUserErrorState(this.error);
}


class AppLoadingBookingDataState extends AppLoginStates {}

class AppErrorBookingDataState extends AppLoginStates {}

class AppSuccessBookingDataState extends AppLoginStates {}


class AppLoadingReservationsState extends AppLoginStates {}

class AppErrorReservationsState extends AppLoginStates {
  late String error;

  AppErrorReservationsState(this.error);
}

class AppSuccessReservationsState extends AppLoginStates {}



class AppManInitialState extends AppLoginStates{}

class AppManLoadingState extends AppLoginStates{}

class AppManSuccessState extends AppLoginStates{
  String? token;
  AppManSuccessState(this.token);
}

class AppManErrorState extends AppLoginStates
{
  final String error;
  AppManErrorState(this.error);
}


class ReservationsLoadingState extends AppLoginStates {}

class ReservationsSuccessState extends AppLoginStates {}

class ReservationsErrorState extends AppLoginStates {
  final String error;
  ReservationsErrorState(this.error);
}

class GetActiveLoadingState extends AppLoginStates {}

class GetActiveSuccessState extends AppLoginStates {}

class GetActiveErrorState extends AppLoginStates {
  final String error;
  GetActiveErrorState(this.error);
}
class GetCancelLoadingState extends AppLoginStates {}

class GetCancelSuccessState extends AppLoginStates {}

class GetCancelErrorState extends AppLoginStates {
  final String error;
  GetCancelErrorState(this.error);
}
