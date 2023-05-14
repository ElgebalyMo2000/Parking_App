import 'package:dbproject/shared/components/components.dart';
import 'package:flutter/material.dart';



class ParkingTicketScreen extends StatelessWidget {
  const ParkingTicketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: Text(
              'Parking Ticket'
            ),
       ),
       body: Column(
        children: [
          Container(),
          Container(),
          defaultButton(function: (){}, text: 'Arrive'),
        ],
       ),
    );
  }
}