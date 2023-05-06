import 'package:dbproject/modules/loginScreen/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shared/remote/dio_helper.dart';

class AppLoginCubit extends Cubit<AppLoginStates> {
  AppLoginCubit() : super(AppLoginInitialState());

  static AppLoginCubit get(context) => BlocProvider.of(context);
  void userLogin({
    required String email,
    required String password,
  })
  {
    emit(AppLoginLoadingState());
    DioHelper.postData(
      url: 'login' ,
      data:{
        'email': email,
        'password': password,
      },
    ).then((value)
    {
      print(value);
      emit(AppLoginSuccessState());
    }).catchError((error)
    {
      emit(AppLoginErrorState(error.toString()));
    });
  }
}