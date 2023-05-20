import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/cubit/cubit.dart';
import '../../shared/cubit/states.dart';

class BookingScreen extends StatelessWidget {
  const BookingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return ListView.separated(
            itemBuilder: (context, index) => buildTicketItem(),
            separatorBuilder: (context, index) => SizedBox(height: 20.0),
            itemCount: AppCubit.get(context).len,
          );
        });
  }
}

Widget buildTicketItem() => Container(
      child: Column(
        children: [
          Text('Reservation '),
          SizedBox(height: 20.0),
          Text('Cairo Station Parking'),
          SizedBox(height: 20.0),
        ],
      ),
    );
