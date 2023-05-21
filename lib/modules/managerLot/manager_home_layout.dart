import 'package:dbproject/shared/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/cubit/cubit.dart';

class ManagerHomeLayout extends StatelessWidget {
  const ManagerHomeLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        AppCubit cubit = AppCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: Text(
              cubit.ManagerTitles[cubit.currentIndex],
            ),
          ),
          //backgroundColor: Colors.transparent,
          body: cubit.managerScreens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            //unselectedLabelStyle: TextStyle(color: Colors.grey),
            //selectedItemColor: Colors.black,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.list,
                    color: Color.fromARGB(255, 176, 176, 176),
                  ),
                  label: 'Reservations'),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.check_circle,
                  color: Color.fromARGB(255, 176, 176, 176),
                ),
                label: 'Activation',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.pending,
                    color: Color.fromARGB(255, 176, 176, 176)),
                label: 'Pending',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.access_time,
                    color: Color.fromARGB(255, 176, 176, 176)),
                label: 'Expired',
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.free_cancellation,
                      color: Color.fromARGB(255, 176, 176, 176)),
                  label: 'Cancel'),
            ],
            currentIndex: cubit.currentIndex,
            onTap: (indexManger) {
              cubit.onChangeBottomNavBarManager(indexManger);
            },
          ),
        );
      },
    );
  }
}
