import 'package:dbproject/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:image_picker/image_picker.dart';

import 'dart:io';

class UploadPicture extends StatefulWidget {
  const UploadPicture({super.key});

  @override
  State<UploadPicture> createState() => _UploadPictureState();
}

class _UploadPictureState extends State<UploadPicture> {
  File? uploadImage;

  Future pickedPicture() async {
    // ignore: deprecated_member_use
    final file = await ImagePicker().getImage(source: ImageSource.gallery);

    setState(() {
      uploadImage = File(file!.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    //final mediaQuery = MediaQuery.of(context);
    return Container(
        decoration: const BoxDecoration(
          //color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
          color: Colors.white,
        ),
        child: uploadUrImage(
          Color: Colors.white,
          width: double.infinity,
          height: 60.0,
          onTap: () {
            pickedPicture();
          },
          text: uploadImage != null ? '$uploadImage' : 'Upload Picture',
        ));
  }
}
