import 'package:flutter/material.dart';
import 'package:social_media_app/features/auth/presentation/views/login.dart';
import 'package:social_media_app/features/auth/presentation/views/widgets/custom_button.dart';
import 'package:social_media_app/features/auth/presentation/views/widgets/custom_text_form_filed.dart';
import 'package:social_media_app/features/auth/presentation/views/widgets/custom_text_form_filed_passowrd.dart';



class SingUp extends StatelessWidget {
  const SingUp({super.key});

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
            
            
                const CircleAvatar(
                  radius: 35,
                  backgroundImage: AssetImage("assets/images/images.jpg"),
                ),
            
                const SizedBox(
                  height: 30,
                ),
            
            
                const CustomTextFormFiled(hintText:  "name", iconData: Icons.person),
                const CustomTextFormFiled(hintText: "email", iconData: Icons.email),
                CustomTextFormFiledPassowrd(obscureText: true),
            
            
                const SizedBox(
                  height: 20,
                ),
            
            
            
                const CustomButton(),
            
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

