
import 'package:flutter/material.dart';
import 'package:getwidget/components/avatar/gf_avatar.dart';
import 'package:getwidget/shape/gf_avatar_shape.dart';

import '../../shared/components/components.dart';

 class DescriptionScreen extends StatelessWidget {

  const DescriptionScreen(
      {Key? key,
      required this.title,}
      ) : super(key: key);
  final String? title;

  @override
  Widget build(BuildContext context) {
    print('Title: ${title}');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          'Home'
        ),
      ),
        body: Padding(
          padding: const EdgeInsetsDirectional.only(start: 20.0, top: 8.0,end: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                Container(
                  width: 400.0,
                  height: 160.0,
                  child: GFAvatar(
                        backgroundImage: NetworkImage('https://images.unsplash.com/photo-1604275291560-55f54cec0e4d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8ZW1wdHklMjBwYXJraW5nJTIwbG90fGVufDB8fDB8fHww&w=1000&q=80'),
                        shape: GFAvatarShape.standard,
                      size: 100.0,
                  ),
                ),
                SizedBox(height: 25.0,),
                Text(title ?? "Parking",
                    style: TextStyle(fontFamily: 'ZenDots', fontSize: 18.0,color: Colors.black),),
                SizedBox(height: 30.0,),
                Text("Description",
                  style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.black,
                   fontWeight: FontWeight.w500),
                ),
              Text('This application to reserve your slot remotely. '
                  'If you isn\'t a regular customer the reservtion must happen before your reach within only 2 hours. '
                  'You can use your designated slots for limited time window of a couple hours, after that the slots are freed. '
                  'You must park in your reserved slots. A penalty is you do not leave the parking lot after your time windows elapse, '
                  'but you can certainly leave before your reservations expire.',
                style: TextStyle(fontSize: 14.0,
                fontWeight: FontWeight.w300),
                  ),
              SizedBox(height: 20.0,),
              Text('You can reserve as a regular customer too. Reserve yoyr package easily through this app',
                style: TextStyle(fontSize: 14.0,
                    fontWeight: FontWeight.w300),
              ),
              SizedBox(height: 30.0,),
          GestureDetector(
            onTap: () {},
            child: Center(
              child: Container(
                width: 200.0,
                height: 50.0,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(50.0),
                ),
                child: Center(
                    child: Text('Book Now',
                      style: TextStyle( fontSize: 18.0,color: Colors.white,
                      fontWeight: FontWeight.bold),
                    )),
              ),
            ),
          ),
            ],
          ),
        ),
    );
  }
}
