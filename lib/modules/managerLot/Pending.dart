import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:dbproject/modules/managerLot/customer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/components/components.dart';
import '../../shared/cubit/cubit.dart';
import '../../shared/cubit/states.dart';
import '../loginScreen/cubit/cubit.dart';
import '../loginScreen/cubit/states.dart';

class Pending extends StatelessWidget {
  const Pending({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppLoginCubit, AppLoginStates>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, Object? state) {
        var lotReservePending = AppLoginCubit.get(context).pending;

        return (lotReservePending.isNotEmpty)
            ? ListView.separated(
                itemBuilder: (context, index) =>
                    ReservationBuilder(lotReservePending[index], context),
                separatorBuilder: (context, index) => SizedBox(height: 20.0,),
                itemCount: lotReservePending.length,
              )
            :  Scaffold(
                body: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'No Pending Reservations',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                            color: Colors.grey),
                      )
                    ],
                  ),
                ),
              );
      },
    );
  }
}

Widget ReservationBuilder(Map reservationsPendingModel, context) => Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: Colors.grey.withOpacity(.1),
        ),
        child: MaterialButton(
          onPressed: () {
            // Navigator.push(context,
            //     MaterialPageRoute(builder: (context) => CustomerDetails()));
          },
          child: Column(
            children: [
              Text(
                '${reservationsPendingModel['customer_name']}',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20.0,),
              Row(
                children:
                [
                  defaultButton(function: ()
                  {
                    AppLoginCubit.get(context).userActivate(id:reservationsPendingModel['id'] );
                  },
                    text: 'activate',
                    width: 120.0,
                    background: Colors.black,
                    textColor: Colors.white,
                  ),
                  SizedBox(width: 60.0,),
                  defaultButton(function: (){
                    AppLoginCubit.get(context).userCancel(id:reservationsPendingModel['id'] );
                  },
                    text: 'Cancel',
                    width: 120.0,
                    background: Colors.black,
                    textColor: Colors.white,
                  ),
              ]
              ),
              SizedBox(
                height: 30.0,
              ),
              Text('Duration : ${reservationsPendingModel['duration']}',
                style: TextStyle(
                    fontSize: 15.0,
                ),
              )
            ],
          ),
        ),
      ),
    );
