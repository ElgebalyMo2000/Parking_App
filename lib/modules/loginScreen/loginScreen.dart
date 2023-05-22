import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:dbproject/Layout/parkinglayout.dart';
import 'package:dbproject/modules/loginScreen/cubit/cubit.dart';
import 'package:dbproject/modules/loginScreen/cubit/states.dart';
import 'package:dbproject/modules/managerLot/manager_home_layout.dart';

import 'package:dbproject/modules/signup/signUp.dart';
import 'package:dbproject/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../shared/cache_helper.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool _isVisible = false;
  bool isPassword = true;
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 500), () {
      setState(() {
        _isVisible = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocConsumer<AppLoginCubit,AppLoginStates>(
        listener: (context, state){
      if(state is AppLoginSuccessState) {
        print(state.token);
        CacheHelper.saveData(key: 'token', value:state.token).then((
            value) {
          navigateAndFinish(context, ParkingLayout());
        });
        AppLoginCubit.get(context).getUserDate();
        AppLoginCubit.get(context).reservations = [];
        AppLoginCubit.get(context).getBookingData();
        }
      if(state is AppLoginErrorState || state is AppManErrorState){
         Fluttertoast.showToast(
            msg:'Please ensure you have entered the correct login information.' ,
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 5,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0
        );
      }
      if(state is AppManSuccessState){
        print(state.token);
        CacheHelper.saveData(key: 'secret', value:state.token).then((
            value) {
          navigateAndFinish(context, ManagerHomeLayout());
        });
      }

      },
        builder: (context, state)
        {
          return Scaffold(
            body: AnimatedOpacity(
              opacity: _isVisible ? 1.0 : 0.0,
              duration: Duration(milliseconds: 5000),
              child: SingleChildScrollView(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: Center(
                    child: Form(
                      key: formKey,
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
                              'Sign In',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 50.0,
                                fontFamily: 'ZenDots',
                              ),
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            defaultTextFormField(
                                Type: TextInputType.emailAddress,
                                controller: emailController,
                                validate: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'please enter your email address';
                                  }else if(!isEmailValid(value)){
                                    return'Incorrect email format';
                                  }
                                  return null;
                                },
                                label: 'Email Address/Parking-lot',
                                prefix: Icons.email),
                            const SizedBox(
                              height: 10.0,
                            ),
                            defaultTextFormField(
                              Type: TextInputType.emailAddress,
                              controller: passwordController,
                              validate: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'please enter your password';
                                }
                                return null;
                              },
                              label: 'Password',
                              prefix: Icons.lock,
                              suffix: isPassword
                                  ? Icons.visibility_outlined
                                  : Icons.visibility_off_outlined,
                              isPassword: isPassword,
                              suffixPressed: () {
                                setState(() {
                                  isPassword = !isPassword;
                                });
                              },
                            ),
                            SizedBox(
                              height: 30.0,
                            ),
                            ConditionalBuilder(
                              condition: state is! AppLoginLoadingState,
                              builder: (context) =>  defaultButton(
                                  function: () {
                                    if (formKey.currentState?.validate() ?? true) {
                                      AppLoginCubit.get(context).userLogin(
                                        email: emailController.text,
                                        password: passwordController.text,
                                      );
                                    }
                                  },
                                  text: 'sign in'), fallback: (BuildContext context) => Center(child: CircularProgressIndicator()),
                            ),
                            SizedBox(
                              height: 5.0,
                            ),
                            ConditionalBuilder(
                              condition: state is! AppManLoadingState,
                              builder: (context) =>  defaultButton(
                                  function: () {
                                      AppLoginCubit.get(context).managerLogin(
                                        name: emailController.text,
                                        secret: passwordController.text,
                                      );
                                  },
                                  text: 'sign in as manager'), fallback: (BuildContext context) => Center(child: CircularProgressIndicator()),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Don\'t have an account?',
                                  style: TextStyle(color: Colors.white),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => signupScreen()));
                                  },
                                  child: Text(
                                    'Sign Up',
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
    );
  }
}
