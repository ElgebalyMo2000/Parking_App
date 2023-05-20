import 'package:dbproject/shared/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/cubit/cubit.dart';

class ManagerHomeLayout extends StatelessWidget {
  const ManagerHomeLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = AppCubit.get(context);
          return Scaffold(
            body: cubit.managerScreens[cubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              items: cubit.bottomManagerItems,
              currentIndex: cubit.currentIndex,
              onTap: (indexManger) {
                cubit.onChangeBottomNavBarManager(indexManger);
              },
            ),
          );
        },
      ),
    );
  }
}
