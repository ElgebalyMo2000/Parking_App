import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:dbproject/modules/loginScreen/cubit/cubit.dart';
import 'package:dbproject/modules/loginScreen/cubit/states.dart';
import 'package:dbproject/shared/cubit/cubit.dart';
import 'package:dbproject/shared/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../shared/components/components.dart';
//import 'package:syncfusion_flutter_datepicker/datepicker.dart';
//import 'package:intl/intl.dart';

class bookParking extends StatelessWidget {
  bookParking({super.key, required this.id});
  final int id;

  var durationController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppLoginCubit, AppLoginStates>(
      listener: (context, state) {
        if (state is AppSuccessReservationsState) {
          AppLoginCubit.get(context).getBookingData();
          Fluttertoast.showToast(
              msg: 'Reservation pending!',
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 5,
              backgroundColor: Colors.green,
              textColor: Colors.white,
              fontSize: 16.0);
        }
        if (state is AppErrorReservationsState) {
          Fluttertoast.showToast(
              msg:
                  'Either there is no Capacity at this lot, or Pending reservation',
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 5,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0);
        }
      },
      builder: (context, state) {
        print('id: ${id}');
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back)),
            title: const Text('Book Parking Details'),
          ),
          body: Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(' How long are you going to park?',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 20.0,
                      )),
                  SizedBox(height: 20.0),
                  defaultTextFormField(
                      Type: TextInputType.number,
                      controller: durationController,
                      validate: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please Enter your duration';
                        }
                        return null;
                      },
                      label: 'Duration',
                      prefix: Icons.directions_car_filled),
                  const SizedBox(
                    height: 30.0,
                  ),
                  ConditionalBuilder(
                    condition: state is! AppLoadingReservationsState,
                    builder: (context) => defaultButton(
                        textColor: Colors.white,
                        background: Colors.black,
                        function: () {
                          try {
                            int intVar = int.parse(durationController.text);
                            if (formKey.currentState?.validate() ?? true) {
                              AppLoginCubit.get(context).postUserRserve(
                                id: id,
                                duration: intVar,
                              );
                            }
                          } catch (e) {
                            Fluttertoast.showToast(
                                msg: 'Please, enter your duration.',
                                toastLength: Toast.LENGTH_LONG,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 5,
                                backgroundColor: Colors.red,
                                textColor: Colors.white,
                                fontSize: 16.0);
                            print('Error parsing inputString: $e');
                          }
                        },
                        text: 'Confirm'),
                    fallback: (BuildContext context) =>
                        Center(child: CircularProgressIndicator()),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
