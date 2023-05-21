import 'package:dbproject/modules/loginScreen/splashScreen.dart';
import 'package:dbproject/shared/bloc_observer.dart';
import 'package:dbproject/shared/components/constants.dart';
import 'package:dbproject/shared/cubit/cubit.dart';
import 'package:dbproject/shared/cubit/states.dart';
import 'package:dbproject/shared/remote/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'modules/details/parking_ticket_screen.dart';
import 'modules/details/paying_confirmation_screen.dart';
import 'modules/details/payment_method_screen.dart';
import 'modules/loginScreen/cubit/cubit.dart';
import 'modules/timer_scren.dart';
import 'shared/cache_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();

  var token = CacheHelper.getData(key: 'token');

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => AppCubit(),
        ),
        BlocProvider(
          create: (BuildContext context) => AppLoginCubit(),
        ),
      ],
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              visualDensity: VisualDensity.adaptivePlatformDensity,
              appBarTheme: const AppBarTheme(
                backgroundColor: Colors.white,
                titleTextStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 20.0,
                ),
                iconTheme: IconThemeData(
                  color: Colors.black,
                ),
                elevation: 0.0,
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: Colors.transparent,
                  statusBarIconBrightness: Brightness.dark,
                ),
              ),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                backgroundColor: Colors.grey.withOpacity(.3),
                elevation: 0.0,
                selectedItemColor: Colors.black,
              ),
            ),
            home: splashScreen(),
          );
        },
      ),
    );
  }
}
