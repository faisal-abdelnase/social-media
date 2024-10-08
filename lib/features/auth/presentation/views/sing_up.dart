import 'dart:io';


import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:social_media_app/core/models/user_model.dart';
import 'package:social_media_app/core/show_snack_bar.dart';
import 'package:social_media_app/features/auth/presentation/manager/bloc/auth_bloc.dart';
import 'package:social_media_app/features/auth/presentation/views/login.dart';
import 'package:social_media_app/features/auth/presentation/views/widgets/custom_button.dart';
import 'package:social_media_app/features/auth/presentation/views/widgets/custom_text_form_filed.dart';
import 'package:social_media_app/features/auth/presentation/views/widgets/custom_text_form_filed_passowrd.dart';
import 'package:social_media_app/features/home/presentation/screen/home_screen.dart';
import 'package:uuid/uuid.dart';

class SingUp extends StatefulWidget {
  const SingUp({super.key});

  @override
  State<SingUp> createState() => _SingUpState();
}

class _SingUpState extends State<SingUp> {
  File? pickedImage;
  

  void selectImage() async {
    var image = await ImagePicker().pickImage(source: ImageSource.gallery);
    var selected = File(image!.path);

    setState(() {
      pickedImage = selected;
    });
  }

  GlobalKey<FormState> formKey = GlobalKey();
  bool isLoading = false;

  late String email;
  late String passowrd;
  late String userName;


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if(state is SingUpLoaing){
          isLoading = true;
        }

        else if(state is SingUpSuccess){
          Navigator.pushNamed(context, HomeScreen.id);
          isLoading = false;
        }
        else if( state is SingUpFailuer){
          
          showSnaklBar(context, state.errMessage);
          isLoading = false;
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: isLoading,
          child: Scaffold(
            body: Form(
              key: formKey,
              child: SingleChildScrollView(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 128),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Intsa app",
                          style: TextStyle(fontSize: 28),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Stack(
                          children: [
                            pickedImage != null
                                ? CircleAvatar(
                                    radius: 35,
                                    backgroundImage: FileImage(pickedImage!),
                                    backgroundColor: Colors.white,
                                  )
                                : const CircleAvatar(
                                    radius: 35,
                                    backgroundImage:
                                        AssetImage("assets/images/images.jpg"),
                                    backgroundColor: Colors.white,
                                  ),
                            Positioned(
                              top: 30,
                              left: 30,
                              child: IconButton(
                                onPressed: () {
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
                          hintText: "name",
                          iconData: Icons.person,
                          
                          onChanged: (data) {
                            userName = data;
                          },
                        ),

                        CustomTextFormFiled(
                          hintText: "email",
                          iconData: Icons.email,
                          
                          onChanged: (data) {
                            email = data;
                          },
                        ),
                        CustomTextFormFiledPassowrd(

                          onChanged: (data) {
                            passowrd = data;
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomButton(
                          onPressed: () async {
                            if (formKey.currentState!.validate()) {
                              BlocProvider.of<AuthBloc>(context).
                              add(SingUpEvent(email: email, passowrd: passowrd));


                              // to give different id every image
                              final uuId = Uuid().v4();

                              // to add image to storage
                              final ref = FirebaseStorage.instance.ref()
                              .child('usersImages').child("${uuId}jpg");

                              await ref.putFile(pickedImage!);
                              final imageUrl = await ref.getDownloadURL();

                              UserModel user = UserModel(
                                passowrd: passowrd, 
                                email: email, 
                                userName: userName, 
                                userImage: imageUrl, 
                                uID: FirebaseAuth.instance.currentUser!.uid, 
                                followers: [], 
                                folloeing: []);

                                BlocProvider.of<AuthBloc>(context).
                              add(AddUser(user: user));
                            }
                          },
                          text: "Sign up",
                        ),

                        // this button to sign up
                        TextButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const Login()));
                            },
                            child: Text(
                              "do you have an account?",
                              style: TextStyle(color: Colors.blue[600]),
                            ))
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
