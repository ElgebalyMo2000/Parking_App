import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget defaultButton({
  double width = 337.0,
  double height: 50,
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
          style: TextStyle(fontFamily: 'ZenDots', fontSize: 16.0),
        )),
      ),
    );

Widget defaultTextFormField({
  required TextEditingController controller,
  Function(String)? onSubmit,
  Function(String)? onChange,
  VoidCallback? onTap,
  required String? Function(String?) validate,
  required String label,
  required IconData prefix,
  IconData? suffix,
  bool isPassword = false,
  VoidCallback? suffixPressed,
  required TextInputType Type,
  //bool isClickable = true,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: Type,
      onChanged: onChange,
      onFieldSubmitted: onSubmit,
      validator: validate,
      onTap: onTap,
      obscureText: isPassword,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintText: label,
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
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
      ),
    );
