import 'package:dbproject/modules/managerLot/Reservations.dart';
import 'package:dbproject/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/login_model.dart';
import '../../shared/cubit/cubit.dart';
import '../../shared/cubit/states.dart';

class CustomerDetails extends StatelessWidget {
  const CustomerDetails({Key? key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var customDetails = AppCubit.get(context).details;

        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'Customer Details',
            ),
            leading: IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ReservationScreen()));
                },
                icon: const Icon(Icons.arrow_back)),
          ),
          body: customDetails.isNotEmpty
              ? ListView.separated(
                  itemBuilder: (context, index) =>
                      CustomerInformation(customDetails[index], context),
                  separatorBuilder: (context, index) => dividerItem(),
                  itemCount: customDetails.length,
                  physics: const BouncingScrollPhysics(),
                )
              : const Center(
                  child: Text('No customer details available'),
                ),
        );
      },
    );
  }
}

Widget CustomerInformation(Map bookingData, context) => Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: Colors.grey.withOpacity(.1),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Row(
                children: [
                  Text('Parking Lot Name : ${bookingData['lot_name']}'),
                  Text('ID : ${bookingData['id']}'),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Text('State : ${bookingData['state']}'),
                  Text('Duration : ${bookingData['duration']}'),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Text('Start Time : ${bookingData['start_time']}'),
                  Text('Total Pay : ${bookingData['total_pay']}'),
                ],
              ),
            ),
            defaultButton(function: () {}, text: 'Activate'),
            defaultButton(function: () {}, text: 'Cancel')
          ],
        ),
      ),
    );
