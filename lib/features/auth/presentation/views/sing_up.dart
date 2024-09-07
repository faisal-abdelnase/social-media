import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:social_media_app/features/auth/presentation/views/login.dart';
import 'package:social_media_app/features/auth/presentation/views/widgets/custom_button.dart';
import 'package:social_media_app/features/auth/presentation/views/widgets/custom_text_form_filed.dart';
import 'package:social_media_app/features/auth/presentation/views/widgets/custom_text_form_filed_passowrd.dart';



class SingUp extends StatefulWidget {
  const SingUp({super.key});

  @override
  State<SingUp> createState() => _SingUpState();
}

class _SingUpState extends State<SingUp> {

  File? pickedImage;

  void selectImage() async{

    var image = await ImagePicker().pickImage(source: ImageSource.gallery);
    var selected = File(image!.path);

    setState(() {
      pickedImage = selected;
    });
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 128),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Intsa app", 
                style: TextStyle(
                  fontSize: 28
                ),
                ),
            
                const SizedBox(
                  height: 30,
                ),
            
            
                Stack(
                  children: [
                    pickedImage != null?
                    CircleAvatar(
                    radius: 35,
                    backgroundImage: FileImage(pickedImage!),
                    backgroundColor: Colors.white,

                  ):
                  const CircleAvatar(
                    radius: 35,
                    backgroundImage: AssetImage("assets/images/images.jpg"),
                    backgroundColor: Colors.white,

                  ),


                  Positioned(
                    top: 30,
                    left: 30,
                    child: IconButton(
                    
                      onPressed: (){
                        selectImage();
                      }, 
                      icon: const Icon(
                        Icons.add_circle_outline_rounded,
                        color: Colors.black,
                        ),
                    
                      ),
                    ),
                  ],
                ),
            
                const SizedBox(
                  height: 30,
                ),
            
            
                CustomTextFormFiled(
                  hintText:  "name", 
                  iconData: Icons.person,
                  onFieldSubmitted: (name) {
                    
                  },
                  ),


                CustomTextFormFiled(
                  hintText: "email", 
                  iconData: Icons.email,
                  onFieldSubmitted: (email) {
                    
                  },
                  ),
                CustomTextFormFiledPassowrd(
                  onFieldSubmitted: (passowrd) {
                  
                },),
            
            
                const SizedBox(
                  height: 20,
                ),
            
            
            
                const CustomButton(text: "Sign up",),
            
                  TextButton(
                    onPressed: (){
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => const Login()));
                    }, 
                    child: Text("do you have an account?",
                    style: TextStyle(
                      color: Colors.blue[600]
                    ),))
            
                
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}

