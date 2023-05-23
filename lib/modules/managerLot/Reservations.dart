
import 'package:dbproject/modules/loginScreen/cubit/cubit.dart';

import 'package:dbproject/shared/cubit/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../shared/components/components.dart';

import '../loginScreen/cubit/states.dart';

class ReservationScreen extends StatelessWidget {
  const ReservationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppLoginCubit, AppLoginStates>(
        listener: (BuildContext context, state) {},
        builder: (BuildContext context, state) {
          var lotReserve = AppLoginCubit.get(context).reservationsLot;
          print(lotReserve);
          return (lotReserve.isNotEmpty)
              ? ListView.separated(
                  itemBuilder: (context, index) =>
                      ReservationBuilder(lotReserve[index], context),
                  separatorBuilder: (context, index) => SizedBox(height: 15.0),
                  itemCount: lotReserve.length,
                )
              :  Scaffold(
                  body: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'No Reservations',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                              color: Colors.grey),
                        )
                      ],
                    ),
                  ),
                );
        });
  }
}

Widget ReservationBuilder(Map reservationsModel, context) => Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: Colors.grey.withOpacity(.1),
        ),
        child: MaterialButton(
          onPressed: () {
            //Navigator.push(context,
                //MaterialPageRoute(builder: (context) => CustomerDetails()));
          },
          child: Column(
            children: [
              Text(
                '${reservationsModel['customer_name']}',
                style: const TextStyle(
                    fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 50.0,
              ),
              Row(
                children: [
                  Text('State : ${reservationsModel['state']}',
                    style: TextStyle(
                      fontSize: 15.0,
                    ),
                  ),
                  const SizedBox(
                    width: 20.0,
                  ),
                  Text('Duration : ${reservationsModel['duration']}',
                    style: TextStyle(
                      fontSize: 15.0,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
