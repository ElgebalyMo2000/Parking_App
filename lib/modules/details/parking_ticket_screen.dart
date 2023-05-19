import 'package:dbproject/shared/components/components.dart';
import 'package:flutter/material.dart';



class ParkingTicketScreen extends StatelessWidget {
   ParkingTicketScreen({super.key});

   String name = 'Mohamed';
   String parkingName = 'M.pool Garage';
   String duration = '2 h';
   String startTime = '9 Am';
   String endTime = '11 Am';
   String vehicle = 'Tyota(94331)';
   String parkingSlot = '2';
   String date = 'May 11,2023';
   String phone = '01123654782';

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
          Container(
            height: MediaQuery.of(context).size.height*.3,
            child:Image.asset(
            'assets/images/logo-DB.png',
          ), 
          ),
          Container(
            padding: EdgeInsets.all(15),
            margin: EdgeInsets.all(20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                    color: Colors.grey[400]!,
                   
                )
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text('Name',style:TextStyle(color: Colors.grey[400],fontSize: 20),),
                    Text('$name',style:TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),),
                    SizedBox(height: 20,),
                    Text('Parking Name',style:TextStyle(color: Colors.grey[400],fontSize: 20),),
                    Text('$parkingName',style:TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),),
                    SizedBox(height: 20,),
                    Text('Duration',style:TextStyle(color: Colors.grey[400],fontSize: 20),),
                    Text('$duration',style:TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),),
                    SizedBox(height: 20,),
                    Text('Hours',style:TextStyle(color: Colors.grey[400],fontSize: 20),),
                    Text('${startTime} - ${endTime}',style:TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),),
                  ],
                ),
                Column(
                  children: [
                    Text('Vehicle',style:TextStyle(color: Colors.grey[400],fontSize: 20),),
                    Text('$vehicle',style:TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),),
                    SizedBox(height: 20,),
                    Text('Parking Slot',style:TextStyle(color: Colors.grey[400],fontSize: 20),),
                    Text('$parkingSlot',style:TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),),
                    SizedBox(height: 20,),
                    Text('Date',style:TextStyle(color: Colors.grey[400],fontSize: 20),),
                    Text('$date',style:TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),),
                    SizedBox(height: 20,),
                    Text('Phone',style:TextStyle(color: Colors.grey[400],fontSize: 20),),
                    Text('$phone',style:TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),),
                  ],
                ),
              ],
            ),
          ),
          defaultButton(
            function: (){}, 
            text: 'Arrive',
            background: Colors.black,
            textColor: Colors.white,
            ),
        ],
       ),
    );
  }
}