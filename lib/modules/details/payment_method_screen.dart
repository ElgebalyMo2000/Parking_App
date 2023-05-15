import 'package:dbproject/shared/components/components.dart';
import 'package:flutter/material.dart';

class PaymentMethodScren extends StatelessWidget {
  PaymentMethodScren({super.key});
  var cardNumberController = TextEditingController();
  var passwordController = TextEditingController();
  var cvvController = TextEditingController();
  var expiredDateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book Parking Details'),
      ),
      body: SingleChildScrollView(
        child: Column(
          
          children: [
            Container(
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Payment Method',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Image.asset('assets/images/card_logo.PNG'),
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(10),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text('Card Number',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                    ],
                  ),
                  SizedBox(height: 5,),
                  defaultTextFormField(
                      controller: cardNumberController,
                      backgroundColor: Colors.grey.withOpacity(.1),
                      Type: TextInputType.number),
                       
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text('Password',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                    ],
                  ),
                  SizedBox(height: 5,),
                  defaultTextFormField(
                      controller: passwordController,
                      backgroundColor: Colors.grey.withOpacity(.1),
                      Type: TextInputType.visiblePassword,
                      isPassword: true),
                       SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('CVV',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                          SizedBox(height: 5,),
                          Container(
                            width: 170,
                            child: defaultTextFormField(
                              controller: cvvController,
                              backgroundColor: Colors.grey.withOpacity(.1),
                              Type: TextInputType.number,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 20.0,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Expired Date',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                          SizedBox(height: 5,),
                          Container(
                            width: 170,
                            child: defaultTextFormField(
                              backgroundColor: Colors.grey.withOpacity(.1),
                              controller: expiredDateController,
                              Type: TextInputType.datetime,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 10,),
            defaultButton(
                  function: () {},
                  text: 'ADD',
                  background: Colors.black,
                  textColor: Colors.white,
                ),
          ],
        ),
      ),
    );
  }
}
