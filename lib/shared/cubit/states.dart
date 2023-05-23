abstract class AppStates {}

class AppInitialState extends AppStates {}

class AppChangeBottomNavBarState extends AppStates {}

class AppLoadingBookingDataState extends AppStates {}

class AppErrorBookingDataState extends AppStates {}

class AppSuccessBookingDataState extends AppStates {}

class ManagerChangeBottomNavBarState extends AppStates {}

class ReservationsLoadingState extends AppStates {}

class ReservationsSuccessState extends AppStates {}

class ReservationsErrorState extends AppStates {
  final String error;
  ReservationsErrorState(this.error);
}

class GetCustomerDataLoadingState extends AppStates {}

class GetCustomerDataSuccessState extends AppStates {}

class GetCustomerDataErrorState extends AppStates {
  final String Error;
  GetCustomerDataErrorState(this.Error);
}



class GetActiveLoadingState extends AppStates {}

class GetActiveSuccessState extends AppStates {}

class GetActiveErrorState extends AppStates {
  final String error;
  GetActiveErrorState(this.error);
}



