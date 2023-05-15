import 'package:dbproject/modules/details/parking_ticket_screen.dart';
import 'package:flutter/material.dart';

import '../../shared/components/components.dart';

class PayingConfirmationScreen extends StatelessWidget {
  PayingConfirmationScreen({super.key});
  var cardNumberController = TextEditingController();
  var passwordController = TextEditingController();
  var cvvController = TextEditingController();
  var expiredDateController = TextEditingController();
  bool enable = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book Parking Details'),
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        margin: EdgeInsets.symmetric(vertical: 30, horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              defaultTextFormField(
                  controller: cardNumberController,
                  labelText: 'Card Number',
                  enable: enable,
                  backgroundColor: Colors.grey.withOpacity(.1),
                  Type: TextInputType.name),
              SizedBox(
                height: 10,
              ),
              defaultTextFormField(
                  controller: passwordController,
                  labelText: 'password',
                  enable: enable,
                  isPassword: true,
                  backgroundColor: Colors.grey.withOpacity(.1),
                  Type: TextInputType.name),
              SizedBox(
                height: 10,
              ),
              defaultTextFormField(
                  controller: cvvController,
                  labelText: 'CVV',
                  isPassword: true,
                  enable: enable,
                  backgroundColor: Colors.grey.withOpacity(.1),
                  Type: TextInputType.name),
              SizedBox(
                height: 10,
              ),
              defaultTextFormField(
                  controller: expiredDateController,
                  labelText: 'Expired Date',
                  enable: enable,
                  backgroundColor: Colors.grey.withOpacity(.1),
                  Type: TextInputType.name),
              SizedBox(height: 100),
              defaultButton(
                function: () => showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    content: Image.asset('assets/images/alartDialog.PNG'),
                    actions: <Widget>[
                      defaultButton(
                        function: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ParkingTicketScreen(),
                              ));
                        },
                        text: 'View Parking Ticket',
                        background: Colors.black,
                        textColor: Colors.white,
                        width: 300,
                      ),
                    ],
                  ),
                ),
                text: 'Pay Now',
                background: Colors.black,
                textColor: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void _showMyDialog(BuildContext context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('AlertDialog Title'),
        content: SingleChildScrollView(
            child: Container(
          child: Image.asset('assets/images/alartDialog.PNG'),
        )),
        actions: <Widget>[
          TextButton(
            child: const Text('View Parking Ticket'),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ParkingTicketScreen(),
                  ));
            },
          ),
        ],
      );
    },
  );
}
