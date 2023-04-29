//library animated_splash_screen;

import 'package:dbproject/modules/loginScreen/loginScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:page_transition/page_transition.dart';

class splashScreen extends StatelessWidget {
  const splashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        splash: Center(
          child: Image.asset(
            'assets/images/logo-DB.png',
          ),
        ),
        backgroundColor: Colors.black,
        duration: 2000,
        splashIconSize: 250.0,
        splashTransition: SplashTransition.fadeTransition,
        pageTransitionType: PageTransitionType.bottomToTop,
        nextScreen: LoginScreen());
  }
}
