import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../modules/loginScreen/loginScreen.dart';
import '../cache_helper.dart';

Widget defaultButton({
  double width = 337.0,
  double height: 50,
  Color textColor = Colors.black ,
  Color background = Colors.white,
  required Function function,
  required String text,
}) =>
    GestureDetector(
      onTap: () {
        function();
      },
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: background,
          borderRadius: BorderRadius.circular(50.0),
        ),
        child: Center(
            child: Text(
          text.toUpperCase(),
          style: TextStyle(fontFamily: 'ZenDots', fontSize: 16.0,color: textColor),
        )),
      ),
    );

Widget defaultTextFormField({
  required TextEditingController controller,
  Function(String)? onSubmit,
  Function(String)? onChange,
  VoidCallback? onTap,
   String? Function(String?)? validate,
   String? label,
  String? labelText,
   IconData? prefix,
  IconData? suffix,
  bool isPassword = false,
  bool enable = true,
  VoidCallback? suffixPressed,
  required TextInputType Type,
  Color? backgroundColor = Colors.white,
  //bool isClickable = true,
}) =>
    TextFormField(
      
      controller: controller,
      keyboardType: Type,
      enabled:enable ,
      onChanged: onChange,
      onFieldSubmitted: onSubmit,
      validator: validate,
      onTap: onTap,
      obscureText: isPassword,
      decoration: InputDecoration(
        filled: true,
        fillColor: backgroundColor,
        
        hintText: label,
        labelText:labelText ,
        prefixIcon: Icon(
          prefix,
          color: Colors.grey,
        ),
        suffixIcon: suffix != null
            ? IconButton(
                onPressed: () {
                  suffixPressed!();
                },
                icon: const Icon(
                  Icons.remove_red_eye,
                  color: Colors.grey,
                ),
              )
            : null,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
        borderSide: BorderSide(
          color: Colors.red,
          width: 0,
          style: BorderStyle.none,
        )
            ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0),
        borderSide: BorderSide(
          color: Colors.red,
          width: 0,
          style: BorderStyle.none,
        )
        ),
      ),
      
    );
// ignore: non_constant_identifier_names
Widget uploadUrImage({
  required double width,
  required double height,
  required Color,
  required onTap,
  required String text,
  //IconData? icon,
}) =>
    GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.only(left: 10.0),
        width: width,
        height: height,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15.0)),
        child: Row(
          children: [
            Icon(
              Icons.camera_alt_outlined,
              color: Colors.grey,
            ),
            SizedBox(
              width: 8.0,
            ),
            Text(
              text,
              style: TextStyle(color: Colors.grey),
            )
          ],
        ),
      ),
    );

void navigateTo(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );

void navigateAndFinish(
  context,
  widget,
) =>
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
      (route) {
        return false;
      },
    );

void showToast({
  required String text,
  required ToastStates state,
}) =>
    Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 5,
      backgroundColor: chooseToastColor(state),
      textColor: Colors.white,
      fontSize: 16.0,
    );

// enum
// ignore: constant_identifier_names
enum ToastStates { SUCCESS, ERROR, WARNING }

Color chooseToastColor(ToastStates state) {
  Color color;

  switch (state) {
    case ToastStates.SUCCESS:
      color = Colors.green;
      break;
    case ToastStates.ERROR:
      color = Colors.red;
      break;
    case ToastStates.WARNING:
      color = Colors.amber;
      break;
  }

  return color;
}

void signOut(context)
{
  CacheHelper.removeData(
    key: 'token',
  ).then((value)
  {
    if (value)
    {
      navigateAndFinish(
        context,
        LoginScreen(),
      );
    }
  });
}
bool isEmailValid(String email) {
  final pattern = r'^[\w-]+(\.[\w-]+)*@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*(\.[a-zA-Z]{2,})$';
  final regExp = RegExp(pattern);
  return regExp.hasMatch(email);
}
