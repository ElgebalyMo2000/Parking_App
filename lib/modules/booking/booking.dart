import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:dbproject/modules/loginScreen/cubit/cubit.dart';
import 'package:dbproject/modules/loginScreen/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/cubit/cubit.dart';
import '../../shared/cubit/states.dart';

class BookingScreen extends StatelessWidget {
  const BookingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppLoginCubit, AppLoginStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var reserve = AppLoginCubit.get(context).reservations;
          print(reserve.length);

          return (reserve.isNotEmpty) ? ListView.separated(
                  itemBuilder: (context, index) =>
                      buildTicketItem(reserve[index], context),
                  separatorBuilder: (context, index) => SizedBox(height: 15.0),
                  itemCount: reserve.length,
                ) : Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                //crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(' There are no tickets, yet',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                      )),
                ],
              ),
            ),
          );
        });
  }
}

Widget buildTicketItem(Map model, context) => Container(
      height: 240.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          color: Colors.grey.withOpacity(.3)),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.cyan,
                borderRadius: BorderRadius.circular(50.0),
              ),
              width: 300.0,
              height: 30.0,
              child: Text('              Ticket Information',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20.0,
                    color: Colors.white
                  )),
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(' Parking Name',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20.0,
                  fontFamily: 'ZenDots',
                )),
            Text('${model['lot_name']}',
                  style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 20.0,
              )
              ),
            SizedBox(height: 10.0),
            Text('State',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20.0,
                  fontFamily: 'ZenDots',
                )),
             Text('${model['state']}',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 20.0,
                  )
              ),
            SizedBox(height: 10.0),
            Text('Parking Duration',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20.0,
                  fontFamily: 'ZenDots',
                )
            ),
            Text('${model['duration']}',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 20.0,
                )
            ),
          ],
        ),
      ),
    );
