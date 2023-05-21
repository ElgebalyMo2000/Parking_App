import 'package:flutter/material.dart';

class Cancellation extends StatelessWidget {
  const Cancellation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Text(
        'expired',
        style: TextStyle(fontSize: 50.0, color: Colors.amber),
      )),
    );
  }
}
