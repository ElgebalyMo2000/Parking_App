import 'package:dbproject/modules/loginScreen/cubit/states.dart';
import 'package:dbproject/shared/network/endpoint.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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

}