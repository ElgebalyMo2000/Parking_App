import 'dart:convert';

import 'package:dbproject/modules/booking/booking.dart';
import 'package:dbproject/modules/parkinglotScreen/lotScreen.dart';
import 'package:dbproject/shared/cache_helper.dart';

import 'package:dbproject/shared/components/components.dart';
import 'package:dbproject/shared/components/constants.dart';
import 'package:dbproject/shared/cubit/states.dart';
import 'package:dbproject/shared/remote/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/login_model.dart';
import '../../modules/profile/profileScreen.dart';
import '../network/endpoint.dart';

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


}
