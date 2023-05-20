// ignore_for_file: non_constant_identifier_names

import 'dart:html';

import 'package:dbproject/modules/booking/booking.dart';
import 'package:dbproject/modules/managerLot/Reservations.dart';
import 'package:dbproject/modules/parkinglotScreen/lotScreen.dart';

import 'package:dbproject/shared/components/components.dart';
import 'package:dbproject/shared/cubit/states.dart';
import 'package:dio_helper_flutter/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../modules/managerLot/Activation.dart';
import '../../modules/managerLot/Cancellation.dart';
import '../../modules/managerLot/Pending.dart';
import '../../modules/managerLot/expired.dart';
import '../../modules/profile/profileScreen.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<Widget> screens = [
    ParkingLot(),
    BookingScreen(),
    ProfileScreen(),
  ];

  List<String> titles = [
    'Select Parking Lot',
    'Parking Ticket',
    'Profile',
  ];

  void changeIndex(int index) {
    currentIndex = index;
    emit(AppChangeBottomNavBarState());
  }

  List<BottomNavigationBarItem> bottomManagerItems = [
    const BottomNavigationBarItem(
        icon: Icon(Icons.list), label: 'All Reservation'),
    const BottomNavigationBarItem(
        icon: Icon(Icons.check_circle), label: 'Activation'),
    const BottomNavigationBarItem(icon: Icon(Icons.pending), label: 'Pending'),
    const BottomNavigationBarItem(
        icon: Icon(Icons.access_time), label: 'Expired'),
    const BottomNavigationBarItem(
        icon: Icon(Icons.free_cancellation), label: 'Cancellation'),
  ];
  List<Widget> managerScreens = [
    const Reservations(),
    const Activation(),
    const Pending(),
    const Cancellation(),
    const ExpiredReservation(),
  ];
  void onChangeBottomNavBarManager(int indexManger) {
    currentIndex = indexManger;
    emit(ManagerChangeBottomNavBarState());
  }

  List<dynamic> Reservations = [];
  void getReservation() {
    emit(ManagerLoadingState());
    DioHelper.getData(Url: baseUrl);
  }
}
