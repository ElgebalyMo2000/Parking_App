import 'package:dbproject/shared/UploadPicture/UploadPicture.dart';
import 'package:dbproject/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
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
                      const UploadPicture(),
                      const SizedBox(
                        height: 10.0,
                      ),
                      defaultButton(
                          function: () {
                            if (formKey.currentState?.validate() ?? true) {
                              print(emailController.text);
                              print(passwordController.text);
                            }
                          },
                          text: 'sign up'),
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
  }
}
