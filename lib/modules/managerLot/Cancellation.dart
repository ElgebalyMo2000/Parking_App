import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:dbproject/modules/managerLot/customer.dart';
import 'package:dbproject/shared/components/components.dart';
import 'package:dbproject/shared/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/cubit/cubit.dart';

class Cancellation extends StatelessWidget {
  const Cancellation({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, Object? state) {
        var lotReserveCancel = AppCubit.get(context).reservationsCancelLot;

        return ConditionalBuilder(
          condition: AppCubit.get(context).reservationsCancelModel != null,
          builder: (context) => ListView.separated(
            itemBuilder: (context, index) =>
                ReservationBuilder(lotReserveCancel[index], context),
            separatorBuilder: (context, index) => dividerItem(),
            itemCount: lotReserveCancel.length,
            physics: const BouncingScrollPhysics(),
          ),
          fallback: (context) =>
              const Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}

Widget ReservationBuilder(Map reservationsCancelModel, context) => Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: Colors.grey.withOpacity(.1),
        ),
        child: MaterialButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => CustomerDetails()));
          },
          child: Column(
            children: [
              Text(
                '${reservationsCancelModel['customer_name']}',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 50.0,
              ),
              Text('Duration : ${reservationsCancelModel['duration']}')
            ],
          ),
        ),
      ),
    );
