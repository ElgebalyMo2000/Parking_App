import 'package:dbproject/modules/loginScreen/cubit/states.dart';
import 'package:dbproject/shared/network/endpoint.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../models/login_model.dart';
import '../../../shared/cache_helper.dart';
import '../../../shared/remote/dio_helper.dart';

class AppLoginCubit extends Cubit<AppLoginStates> {
  AppLoginCubit() : super(AppLoginInitialState());

  static AppLoginCubit get(context) => BlocProvider.of(context);
  String? token;
  List<Map<String, dynamic>> reservationsLot = [];

  Future<void> userLogin({
    required String email,
    required String password,
  }) async {
    emit(AppLoginLoadingState());
    DioHelper.postData(
      url: LOGIN,
      data: {
        'email': email,
        'password': password,
      },
    ).then((value) {
      token = value.data;
      emit(AppLoginSuccessState(token));
    }).catchError((error) {
      emit(AppLoginErrorState(error.toString()));
    });
  }

  UserData? userDataModel;

  void getUserDate() {
    emit(AppGetUserLoadingState());
    CacheHelper.getData(key: 'token');
    DioHelper.getData(
      url: me,
      token: CacheHelper.getData(key: 'token'),
    ).then((value) {
      userDataModel = UserData.fromJson(value.data);
      print(userDataModel?.email);
      emit(AppGetUserSuccessState());
    }).catchError((error) {
      emit(AppGetUserErrorState(error));
    });
  }

  List<Map<String, dynamic>> reservations = [];
  BookingDataModel? bookingModel;

  void getBookingData() {
    emit(AppLoadingBookingDataState());

    DioHelper.getData(
      url: RESERVATIONS,
      token: CacheHelper.getData(key: 'token'),
    ).then((value) {
      if (value != []) {
        value.data.forEach((map) {
          Map<String, dynamic> mergedMap = {};
            mergedMap.addAll(map);
          reservations.add(mergedMap);
        });
        print(reservations[0]['state']);
      }
      //
      //  reservations.add(mergedMap);
      // //print(value.data.length);
      //
      // // bookingModel = BookingDataModel.fromJson(mergedMap);
      // //print(bookingModel?.state);
      emit(AppSuccessBookingDataState());
    }).catchError((error) {
      emit(AppErrorBookingDataState());
    });
  }

  void postUserRserve({
    required int duration,
    required int id,
  }) {
    emit(AppLoadingReservationsState());
    var t = CacheHelper.getData(key: 'token');
    print(t);
    DioHelper.postData(
      url: reserve,
      token: CacheHelper.getData(key: 'token'),
      data: {
        'duration': duration,
        'lot_id': id,
      },
    ).then((value) {
      emit(AppSuccessReservationsState());
    }).catchError((error) {
      print(error);
      emit(AppErrorReservationsState(error.toString()));
    });
  }

  Future<void> managerLogin({
    required String name,
    required String secret,
  }) async {
    emit(AppManLoadingState());
    DioHelper.postData(
      url: MANAGER,
      data: {
        'name': name,
        'secret': secret,
      },
    ).then((value) {
      token = value.data;
      emit(AppManSuccessState(token));
    }).catchError((error) {
      emit(AppManErrorState(error.toString()));
    });
  }
  List<Map<String, dynamic>> pending = [];
  List<Map<String, dynamic>> active = [];
  List<Map<String, dynamic>> cancel = [];
  List<Map<String, dynamic>> expired = [];

  Future<void> getReservations() async {
    emit(ReservationsLoadingState());

    DioHelper.getData(
      url: lotReservations,
      token: CacheHelper.getData(key: 'secret'),
    ).then((value) {
      print((value.data[0]['id']));
      if (value != []) {
        value.data.forEach((map) {
          Map<String, dynamic> mergedMap = {};

          mergedMap.addAll(map);
          print(mergedMap);
          reservationsLot.add(mergedMap);
        });
        print(reservationsLot[0]['customer_name']);
      }
      reservationsLot.forEach((map)  {
        if(map['state'] == 'pending'){
          pending.add(map);
        }else if(map['state'] == 'active'){
          active.add(map);
        }else if(map['state'] == 'cancel') {
          cancel.add(map);
        }else {
          expired.add(map);
        }
      });
      print(pending);
      print(active);

      emit(ReservationsSuccessState());
    }).catchError((error) {
      emit(ReservationsErrorState(error.toString()));
    });
  }
  Future<void> userActivate({
    required int id,
  }) async {
    emit(GetActiveLoadingState());
    DioHelper.postData(
      url: '/reservations/parking-lot/$id/activate',
      token: CacheHelper.getData(key: 'secret'),
    ).then((value) {
      print(id);
      emit(GetActiveSuccessState());
    }).catchError((error) {
      emit(GetActiveErrorState(error.toString()));
    });
  }
  Future<void> userCancel({
    required int id,
  }) async {
    emit(GetCancelLoadingState());
    DioHelper.postData(
      url: '/reservations/parking-lot/$id/cancel',
      token: CacheHelper.getData(key: 'secret'),
    ).then((value) {
      print(id);
      emit(GetCancelSuccessState());
    }).catchError((error) {
      emit(GetCancelErrorState(error.toString()));
    });
  }
}
