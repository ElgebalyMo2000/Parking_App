import 'package:dbproject/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class selectVehicle extends StatelessWidget {
  const selectVehicle({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Select Your Vehicle',
        ),
        leading:
            IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_back)),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: Colors.grey.withOpacity(.1),
              ),
              child: vButton(
                  onPressed: () {},
                  text: '4*4 Truck',
                  image: const AssetImage('assets/images/t4.jpg')),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: Colors.grey.withOpacity(.1),
              ),
              child: vButton(
                  onPressed: () {},
                  text: 'Toyota Land Cruiser',
                  image: const AssetImage('assets/images/to.jpg')),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: Colors.grey.withOpacity(.1),
              ),
              child: vButton(
                  onPressed: () {},
                  text: 'KIA SELTOS',
                  image: const AssetImage('assets/images/kia1.png')),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: Colors.grey.withOpacity(.1),
              ),
              child: vButton(
                  onPressed: () {},
                  text: 'Honda City',
                  image: const AssetImage('assets/images/hon.png')),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: Colors.grey.withOpacity(.1),
              ),
              child: vButton(
                  onPressed: () {},
                  text: 'Motorcycle',
                  image: const AssetImage('assets/images/mo.png')),
            ),
          )
        ]),
      ),
    );
  }
}
