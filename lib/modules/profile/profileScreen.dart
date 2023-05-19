
import 'package:dbproject/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';


class ProfileScreen extends StatefulWidget {
   ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  var idController = TextEditingController();

  var vNumberController = TextEditingController();

  var emailController = TextEditingController();

  var phoneNumberController = TextEditingController();

  var genderController = TextEditingController();


  File? _image;

  Future<void> _pickImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedImage = await picker.getImage(source: source);

    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage:_image != null ? FileImage(_image!) : null,
             backgroundColor: Colors.grey.withOpacity(.3),
              radius: 70,
              child: Align(
                alignment: Alignment.bottomRight,
                child: IconButton(
                  icon: Icon(Icons.camera_alt_outlined,size: 35,color: Colors.grey,),
                  onPressed: () {
                    _pickImage(ImageSource.gallery);
                  },
                ),
              ),
            ),
            SizedBox(height: 20,),
            Text(
              'Mohamed Elgebaly',
              style: TextStyle(fontSize: 20, color: Colors.black),
            ),
            SizedBox(height: 20,),
            defaultTextFormField(
                controller: idController,
                label: 'ID',
                backgroundColor: Colors.grey.withOpacity(.1),
                Type: TextInputType.number),
                
                SizedBox(height: 10,),
            defaultTextFormField(
                controller:   vNumberController,
                label: 'Vehicle Number',
                 backgroundColor: Colors.grey.withOpacity(.1),
                Type: TextInputType.name),
                SizedBox(height: 10,),
            defaultTextFormField(
                controller: emailController,
                label: 'Email',
                 backgroundColor: Colors.grey.withOpacity(.1),
                Type: TextInputType.emailAddress),
                SizedBox(height: 10,),
            defaultTextFormField(
                controller: phoneNumberController,
                label: 'Phone Number',
                 backgroundColor: Colors.grey.withOpacity(.1),
                Type: TextInputType.phone),
                SizedBox(height: 10,),
            defaultTextFormField(
                controller: genderController,
                label: 'Gender',
                 backgroundColor: Colors.grey.withOpacity(.1),
                Type: TextInputType.name),
                SizedBox(height: 30,),
            defaultButton(function: () {
            },
             text: 'Edit Profile',
             background: Colors.black,
             textColor: Colors.white),
             SizedBox(height: 20,),
            defaultButton(function: () {
              signOut(context);
            },
                text: 'Sign Out',
                background: Colors.black,
                textColor: Colors.white),
          ],
        ),
      ),
    ));
  }
}
