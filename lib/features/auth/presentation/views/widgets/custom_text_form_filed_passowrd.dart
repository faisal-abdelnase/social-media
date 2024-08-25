import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// ignore: must_be_immutable
class CustomTextFormFiledPassowrd extends StatefulWidget {
  CustomTextFormFiledPassowrd({super.key, required this.obscureText});

  bool obscureText = false;

  @override
  State<CustomTextFormFiledPassowrd> createState() => _CustomTextFormFiledPassowrdState();
}

class _CustomTextFormFiledPassowrdState extends State<CustomTextFormFiledPassowrd> {
  
  IconData iconData = FontAwesomeIcons.eyeSlash;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: TextFormField(
        validator: (value) {
          if(value!.isEmpty){
            return "Filed is request";
          }
      
          else{
            return null;
          }
        },
        obscureText: widget.obscureText,
        decoration:  InputDecoration(
          hintText: "Password",
      
          hintStyle: const TextStyle(
            color: Colors.grey
          ),
          suffixIcon: IconButton(
            onPressed: (){
              if(widget.obscureText == true){

                widget.obscureText = false;

                
                iconData = FontAwesomeIcons.eye;
                

                setState(() {
                  
                });
              }

              else{
                widget.obscureText = true;
                iconData = FontAwesomeIcons.eyeSlash;

                setState(() {
                  
                });
              }
            }, 
            icon: Icon(iconData)),
                
          border: const OutlineInputBorder(),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.red
            ),
          )
        ),
      ),
    );
  }
}