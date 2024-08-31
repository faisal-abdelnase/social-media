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
    return TextFormField(
      validator: (value) {
        if(value!.isEmpty || value.length < 7){
          return "please enter a valid password";
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
    );
  }
}