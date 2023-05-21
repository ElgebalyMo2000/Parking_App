import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:dbproject/modules/signup/cubit/cubit.dart';
import 'package:dbproject/modules/signup/cubit/states.dart';
import 'package:dbproject/shared/UploadPicture/UploadPicture.dart';
import 'package:dbproject/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

import '../loginScreen/loginScreen.dart';

class signupScreen extends StatefulWidget {
  const signupScreen({super.key});

  @override
  State<signupScreen> createState() => _signupScreenState();
}

class _signupScreenState extends State<signupScreen> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var vnumberController = TextEditingController();
  var genderController = TextEditingController();

  bool _isVisible = false;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isPass = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 400), () {
      setState(() {
        _isVisible = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return BlocProvider(
        create: (context) => AppRegisterCubit(),
        child: BlocConsumer<AppRegisterCubit,AppRegisterStates>(
              listener: (context, state){
                if(state is AppRegisterSuccessState)
                {
                  Fluttertoast.showToast(
                      msg: 'Registration done, please log in',
                      toastLength: Toast.LENGTH_LONG,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 5,
                      backgroundColor: Colors.green,
                      textColor: Colors.white,
                      fontSize: 16.0
                  );
                  navigateTo(context, LoginScreen());
                }else if(state is AppRegisterErrorState){
                  Fluttertoast.showToast(
                      msg: 'Registration Failed',
                      toastLength: Toast.LENGTH_LONG,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 5,
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      fontSize: 16.0
                  );
                }
              },
              builder: (context, state){
                return Scaffold(
                  body: AnimatedOpacity(
                    opacity: _isVisible ? 1.0 : 0.0,
                    duration: Duration(milliseconds: 4000),
                    child: Container(
                      width: mediaQuery.size.width,
                      height: mediaQuery.size.height,
                      child: Center(
                        child: Form(
                          key: formKey,
                          child: SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    'assets/images/logo-DB.png',
                                    height: 200.0,
                                    width: 200.0,
                                  ),
                                  Text(
                                    'Create Your Acount',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 30.0,
                                      fontFamily: 'ZenDots',
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  defaultTextFormField(
                                      controller: nameController,
                                      Type: TextInputType.name,
                                      validate: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter your name!';
                                        }
                                        return null;
                                      },
                                      label: 'Name',
                                      prefix: Icons.person),
                                  const SizedBox(
                                    height: 10.0,
                                  ),
                                  defaultTextFormField(
                                      Type: TextInputType.emailAddress,
                                      controller: emailController,
                                      validate: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'email must not be empty';
                                        }else if(!isEmailValid(value)){
                                          return'Incorrect email format';
                                        }
                                        return null;
                                      },
                                      label: 'Email Address',
                                      prefix: Icons.email),
                                  const SizedBox(
                                    height: 10.0,
                                  ),
                                  defaultTextFormField(
                                    Type: TextInputType.emailAddress,
                                    controller: passwordController,
                                    validate: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'password must not be empty';
                                      }else if(value.length < 6){
                                        return 'password is too short';
                                      }
                                      return null;
                                    },
                                    label: 'password',
                                    prefix: Icons.lock,
                                    suffix: isPass
                                        ? Icons.visibility_outlined
                                        : Icons.visibility_off_outlined,
                                    isPassword: isPass,
                                    suffixPressed: () {
                                      setState(() {
                                        isPass = !isPass;
                                      });
                                    },
                                  ),
                                  const SizedBox(
                                    height: 10.0,
                                  ),
                                  defaultTextFormField(
                                      Type: TextInputType.number,
                                      controller: phoneController,
                                      validate: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please Enter your Number';
                                        }
                                        return null;
                                      },
                                      label: 'Phone Number',
                                      prefix: Icons.numbers),
                                  const SizedBox(
                                    height: 10.0,
                                  ),
                                  defaultTextFormField(
                                      Type: TextInputType.number,
                                      controller: vnumberController,
                                      validate: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please Enter your Vehicle Number';
                                        }
                                        return null;
                                      },
                                      label: 'Vehicle Number',
                                      prefix: Icons.directions_car_filled),
                                  const SizedBox(
                                    height: 10.0,
                                  ),
                                  defaultTextFormField(
                                      Type: TextInputType.text,
                                      controller: genderController,
                                      validate: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please Enter your gender';
                                        }else if(value != 'm' && value != 'f'){
                                          return ' Please Enter m or f' ;
                                        }
                                        return null;
                                      },
                                      label: 'Gender',
                                      prefix: Icons.person),
                                  const SizedBox(
                                    height: 10.0,
                                  ),
                                  const UploadPicture(),
                                  const SizedBox(
                                    height: 10.0,
                                  ),
                                  ConditionalBuilder(
                                    condition: state is! AppRegisterLoadingState,
                                    builder: (context) => defaultButton(
                                        function: () {
                                          if (formKey.currentState?.validate() ?? true) {
                                            AppRegisterCubit.get(context).userRegister(
                                              email: emailController.text,
                                              password: passwordController.text,
                                              name: nameController.text,
                                              phone: phoneController.text,
                                              gender: genderController.text,
                                              vehicle: vnumberController.text
                                            );
                                          }
                                        },
                                        text: 'sign up'), fallback: (BuildContext context) => Center(child: CircularProgressIndicator()),
                                  ),
                                  SizedBox(
                                    height: 5.0,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Already have an account ',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) => LoginScreen()));
                                        },
                                        child: Text(
                                          'Sign In',
                                          style: TextStyle(color: Colors.cyan),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  backgroundColor: Color.fromARGB(255, 0, 0, 0),
                );
              },
        ) ,
    );
  }
}


