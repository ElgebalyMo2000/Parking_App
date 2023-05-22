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

  Future<void> userLogin({
    required String email,
    required String password,
  } ) async{
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

  void getUserDate(){
    emit(AppGetUserLoadingState());
    CacheHelper.getData(key: 'token');
    DioHelper.getData(
      url: me,
      token: CacheHelper.getData(key: 'token'),
    ).then((value) {

      userDataModel = UserData.fromJson(value.data);
      print(userDataModel?.email);
      emit(AppGetUserSuccessState());
    }).catchError((error){
      emit(AppGetUserErrorState(error));
    });
  }

  List<Map<String,dynamic>> reservations = [];
  BookingDataModel? bookingModel;

  void getBookingData(){
    emit(AppLoadingBookingDataState());

    DioHelper.getData(
      url: RESERVATIONS,
      token: CacheHelper.getData(key: 'token'),
    ).then((value) {
      if(value != []) {
        value.data.forEach((element) {
          Map<String, dynamic> mergedMap = {};
          for (var map in value.data) {
            mergedMap.addAll(map);
          }
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
    }).catchError((error){

      emit(AppErrorBookingDataState());
    });
  }

  void postUserRserve({
    required int duration,
    required int id,
  })
  {
    emit(AppLoadingReservationsState());
    var t =   CacheHelper.getData(key: 'token');
    print(t);
    DioHelper.postData(
      url: reserve,
      token: CacheHelper.getData(key: 'token'),
      data: {
        'duration' : duration,
        'lot_id' : id,
      },
    ).then((value) {
      emit(AppSuccessReservationsState());
    }).catchError((error){
      print(error);
      emit(AppErrorReservationsState(error.toString()));
    });
  }
}