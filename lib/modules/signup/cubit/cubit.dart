import 'package:bloc/bloc.dart';
import 'package:dbproject/modules/signup/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../../models/login_model.dart';
import '../../../shared/network/endpoint.dart';
import '../../../shared/remote/dio_helper.dart';

class AppRegisterCubit extends Cubit<AppRegisterStates> {
  AppRegisterCubit() : super(AppRegisterInitialState());
  static AppRegisterCubit get(context) => BlocProvider.of(context);


  void userRegister({
    required String email,
    required String password,
    required String name,
    required String phone,
    required String gender,
    required String vehicle,
  }) {
    emit(AppRegisterLoadingState());
    DioHelper.postData(
      url: REGISTER,
      data: {
        'name': name,
        'email': email,
        'phone_number': phone,
        'password': password,
        'gender': gender,
        'vehicle_number' : vehicle
      },
    ).then((value) {
      print(value.data);
      emit(AppRegisterSuccessState());
    }).catchError((error) {
      print(error);
      emit(AppRegisterErrorState(error.toString()));
    });
    }
}