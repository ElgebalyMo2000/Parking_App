import 'package:dbproject/modules/managerLot/Reservations.dart';
import 'package:flutter/material.dart';

class CustomerDetails extends StatefulWidget {
  const CustomerDetails({super.key});

  @override
  State<CustomerDetails> createState() => _CustomerDetailsState();
}

class _CustomerDetailsState extends State<CustomerDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ReservationScreen()));
            },
            icon: const Icon(Icons.arrow_back)),
      ),
    );
  }
}
