// ignore_for_file: non_constant_identifier_names
import 'dart:convert';

import 'package:dbproject/modules/booking/booking.dart';

import 'package:dbproject/modules/parkinglotScreen/lotScreen.dart';
import 'package:dbproject/shared/components/components.dart';
import 'package:dbproject/shared/components/constants.dart';
import 'package:dbproject/shared/cubit/states.dart';
import 'package:dbproject/shared/remote/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/resevationsModel.dart';
import '../../modules/managerLot/Activation.dart';
import '../../modules/managerLot/Cancellation.dart';
import '../../modules/managerLot/Pending.dart';

import '../../modules/managerLot/Reservations.dart';
import '../../modules/managerLot/expired.dart';
import '../../modules/profile/profileScreen.dart';
import '../cache_helper.dart';
import '../network/endpoint.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  int len = 0;

  List<Widget> screens = [
    ParkingLot(),
    BookingScreen(),
    ProfileScreen(),
  ];

  List<String> titles = [
    'Select Parking Lot',
    'Parking Tickets',
    'Profile',
  ];

  void changeIndex(int index) {
    currentIndex = index;
    emit(AppChangeBottomNavBarState());
  }

  List<String> ManagerTitles = [
    'All Reservations',
    'Active Reservations',
    'Pending Reservations',
    'Expired Reservations',
    'Canceled Reservations',
  ];
  List<Widget> managerScreens = [
    const ReservationScreen(),
    const Activation(),
    const Pending(),
    const ExpiredReservation(),
    const Cancellation(),
  ];

  void onChangeBottomNavBarManager(int indexManger) {
    currentIndex = indexManger;
    emit(ManagerChangeBottomNavBarState());
  }

  List<Map<String, dynamic>> reservationsLot = [];
  ReservationsModel? reservationsModel;

  void getReservations() {
    emit(AppLoadingBookingDataState());

    DioHelper.getData(url: lotReservations, query: {
      'page': '1',
      'per_page': '10',
      //token: CacheHelper.getData(key: 'token')
    }).then((value) {
      // if (value != null) {
      value.data.forEach((element) {
        Map<String, dynamic> mergedMap = {};
        for (var map in value.data) {
          mergedMap.addAll(map);
        }
        reservationsLot.add(mergedMap);
      });
      print(reservationsLot[0]['state']);
      //}
      reservationsModel = ReservationsModel.fromJson(value.data);
      print(reservationsModel.toString());

      emit(ReservationsSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(ReservationsErrorState(error.toString()));
    });
  }

  List<Map<String, dynamic>> reservationsPendingLot = [];
  ReservationsModel? reservationsPendingModel;

  void getPendingReservations() {
    emit(AppLoadingBookingDataState());

    DioHelper.getData(url: lotReservations, query: {
      'state': 'pending',
      'page': '1',
      'per_page': '10',
      //token: CacheHelper.getData(key: 'token')
    }).then((value) {
      //if (value != null) {
      //value.data.forEach((element) {
      // Map<String, dynamic> mergedMap = {};
      // for (var map in value.data) {
      // mergedMap.addAll(map);
      //}
      // reservationsLot.add(mergedMap);
      // });
      // print(reservationsLot[0]['state']);
      //}
      reservationsPendingModel = ReservationsModel.fromJson(value.data);
      print(reservationsPendingModel.toString());

      emit(ReservationsSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(ReservationsErrorState(error.toString()));
    });
  }

  List<Map<String, dynamic>> reservationsActiveLot = [];
  ReservationsModel? reservationsActiveModel;
  void getActiveReservations() {
    emit(AppLoadingBookingDataState());

    DioHelper.getData(url: lotReservations, query: {
      'state': 'active',
      'page': '1',
      'per_page': '5',
      //token: CacheHelper.getData(key: 'token')
    }).then((value) {
      // if (value != null) {
      // value.data.forEach((element) {
      //  Map<String, dynamic> mergedMap = {};
      // for (var map in value.data) {
      //  mergedMap.addAll(map);
      //  }
      //reservationsLot.add(mergedMap);
      //});
      // print(reservationsLot[0]['state']);
      //}
      reservationsActiveModel = ReservationsModel.fromJson(value.data);
      print(reservationsActiveModel.toString());

      emit(ReservationsSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(ReservationsErrorState(error.toString()));
    });
  }

  List<Map<String, dynamic>> reservationsExpireLot = [];
  ReservationsModel? reservationsExpireModel;
  void getExpiredReservations() {
    emit(AppLoadingBookingDataState());

    DioHelper.getData(url: lotReservations, query: {
      'state': 'expired',
      'page': '1',
      'per_page': '5',
      //token: CacheHelper.getData(key: 'token')
    }).then((value) {
      // if (value != null) {
      // value.data.forEach((element) {
      //  Map<String, dynamic> mergedMap = {};
      //  for (var map in value.data) {
      //   mergedMap.addAll(map);
      // }
      // reservationsLot.add(mergedMap);
      // });
      // print(reservationsLot[0]['state']);
      //}
      reservationsExpireModel = ReservationsModel.fromJson(value.data);
      print(reservationsExpireModel.toString());

      emit(ReservationsSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(ReservationsErrorState(error.toString()));
    });
  }

  List<Map<String, dynamic>> reservationsCancelLot = [];
  ReservationsModel? reservationsCancelModel;
  void getCanceledReservations() {
    emit(AppLoadingBookingDataState());

    DioHelper.getData(url: lotReservations, query: {
      'state': 'cancelled by customer',
      'page': '1',
      'per_page': '5',
      //token: CacheHelper.getData(key: 'token')
    }).then((value) {
      // if (value != null) {
      // value.data.forEach((element) {
      // Map<String, dynamic> mergedMap = {};
      // for (var map in value.data) {
      // mergedMap.addAll(map);
      // }
      // reservationsLot.add(mergedMap);
      //});
      // print(reservationsLot[0]['state']);
      //}
      reservationsCancelModel = ReservationsModel.fromJson(value.data);
      print(reservationsCancelModel.toString());

      emit(ReservationsSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(ReservationsErrorState(error.toString()));
    });
  }
}
