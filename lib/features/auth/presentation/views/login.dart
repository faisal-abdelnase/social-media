import 'package:flutter/material.dart';
import 'package:social_media_app/features/auth/presentation/views/sing_up.dart';
import 'package:social_media_app/features/auth/presentation/views/widgets/custom_button.dart';
import 'package:social_media_app/features/auth/presentation/views/widgets/custom_text_form_filed.dart';
import 'package:social_media_app/features/auth/presentation/views/widgets/custom_text_form_filed_passowrd.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16,),
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
          
          
              
              const CustomTextFormFiled(hintText: "email", iconData: Icons.email),
              CustomTextFormFiledPassowrd(obscureText: true),
              Align(
                  alignment: Alignment.bottomRight,
                  child: TextButton(
                    onPressed: (){}, 
                    child:const Text("Forget Password?", 
                    style: TextStyle(
                      color: Color(0xff2196F3),
                    ),)
                    ),
                ),
          
          
              const SizedBox(
                height: 20,
              ),
          
          
          
              const CustomButton(text: "Login",),
          
                TextButton(
                  onPressed: (){
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => const SingUp()));
                  }, 
                  child: Text("Sign up",
                  style: TextStyle(
                    color: Colors.blue[600]
                  ),))
          
              
              
            ],
          ),
        ),
      ),
    );
  }
}