abstract class AppStates {}

class AppInitialState extends AppStates {}

class AppChangeBottomNavBarState extends AppStates {}

class AppLoadingBookingDataState extends AppStates {}

class AppErrorBookingDataState extends AppStates {}

class AppSuccessBookingDataState extends AppStates {}

class ManagerChangeBottomNavBarState extends AppStates {}

class ReservationsSuccessState extends AppStates {}

class ReservationsErrorState extends AppStates {
  final String error;
  ReservationsErrorState(this.error);
}
