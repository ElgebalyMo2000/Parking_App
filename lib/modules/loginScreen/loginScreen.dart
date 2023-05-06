import 'package:dbproject/modules/loginScreen/cubit/cubit.dart';
import 'package:dbproject/modules/loginScreen/cubit/states.dart';
import 'package:dbproject/modules/parkinglotScreen/lotScreen.dart';
import 'package:dbproject/modules/signup/signUp.dart';
import 'package:dbproject/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
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
    return BlocProvider(
      create: (BuildContext context) => AppLoginCubit(),
      child: BlocConsumer<AppLoginCubit,AppLoginStates>(
        listener: (context, state){},
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
                                  return 'please enter your password';
                                }
                                return null;
                              },
                              label: 'password',
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
                            defaultButton(
                                function: () {
                                  if (formKey.currentState?.validate() ?? true) {
                                    print(emailController.text);
                                    print(passwordController.text);
                                    navigateTo(context, parkingLot());
                                  }
                                },
                                text: 'sign in'),
                            SizedBox(
                              height: 5.0,
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
      )
    );
  }
}
