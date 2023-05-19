
import 'package:dbproject/shared/cubit/cubit.dart';
import 'package:dbproject/shared/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getwidget/getwidget.dart';



class ParkingLot extends StatelessWidget {
  const ParkingLot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<AppCubit,AppStates>
          (
          listener: (context, state){

          },
          builder: (context, state)
          {
            return Scaffold(
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Container(

                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          color: Colors.grey.withOpacity(.1),
                        ),
                        height: 80.0,
                        child: MaterialButton(
                          onPressed: ()
                          {

                          },
                          child: Padding(
                            padding: const EdgeInsetsDirectional.only(start: 5.0),
                            child: Row(
                              children: [
                                GFAvatar(
                                  backgroundImage: NetworkImage('https://aaafacilityservices.com/wp-content/uploads/2022/05/clean-parking-lot.jpg'),
                                  shape: GFAvatarShape.standard,
                                  size: 40.0,
                                ),
                                SizedBox(width: 10.0,),
                                Text('M.Pool Garage'
                                    ,style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w400,
                                    )
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10.0,),
                    Padding(
                      padding: const EdgeInsets.only(right: 15.0,
                          left: 15.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          color: Colors.grey.withOpacity(.1),

                        ),

                        height: 80.0,
                        child: MaterialButton(
                          onPressed: ()
                          {

                          },
                          child: Padding(
                            padding: const EdgeInsetsDirectional.only(start: 5.0),
                            child: Row(
                              children: [
                                GFAvatar(
                                  backgroundImage: NetworkImage('https://parksol.lt/content/uploads/2020/07/MEGA-parking-1170x450.png'),
                                  shape: GFAvatarShape.standard,
                                  size: 40.0,
                                ),
                                SizedBox(width: 10.0,),
                                Text('Cairo Station Parking'
                                    ,style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w400,
                                    )
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.0,),
                    Padding(
                      padding: const EdgeInsets.only(right: 15.0,
                          left: 15.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          color: Colors.grey.withOpacity(.1),

                        ),

                        height: 80.0,
                        child: MaterialButton(
                          onPressed: ()
                          {

                          },
                          child: Padding(
                            padding: const EdgeInsetsDirectional.only(start: 5.0),
                            child: Row(
                              children: [
                                GFAvatar(
                                  backgroundImage: NetworkImage('https://watermark.lovepik.com/photo/20211119/large/lovepik-underground-garage-of-urban-construction-shopping-picture_500220959.jpg'),
                                  shape: GFAvatarShape.standard,
                                  size: 40.0,
                                ),
                                SizedBox(width: 10.0,),
                                Text('Al Noor Mosque Parking'
                                    ,style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w400,
                                    )
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.0,),
                    Padding(
                      padding: const EdgeInsets.only(right: 15.0,
                          left: 15.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          color: Colors.grey.withOpacity(.1),

                        ),

                        height: 80.0,
                        child: MaterialButton(
                          onPressed: ()
                          {

                          },
                          child: Padding(
                            padding: const EdgeInsetsDirectional.only(start: 5.0),
                            child: Row(
                              children: [
                                GFAvatar(
                                  backgroundImage: NetworkImage('https://www.jieshun-tech.com/uploadfiles/2021/10/20211020174907527.webp'),
                                  shape: GFAvatarShape.standard,
                                  size: 40.0,
                                ),
                                SizedBox(width: 10.0,),
                                Text('Garage Omar Makram'
                                    ,style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w400,
                                    )
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.0,),
                    Padding(
                      padding: const EdgeInsets.only(right: 15.0,
                          left: 15.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          color: Colors.grey.withOpacity(.1),

                        ),

                        height: 80.0,
                        child: MaterialButton(
                          onPressed: ()
                          {

                          },
                          child: Padding(
                            padding: const EdgeInsetsDirectional.only(start: 5.0),
                            child: Row(
                              children: [
                                GFAvatar(
                                  backgroundImage: NetworkImage('https://parklio.com/assets/img/use-cases/10006/business-intelligence-parking.jpg'),
                                  shape: GFAvatarShape.standard,
                                  size: 40.0,
                                ),
                                SizedBox(width: 10.0,),
                                Text('Al Damar Garage'
                                    ,style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w400,
                                    )
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
  }
}
