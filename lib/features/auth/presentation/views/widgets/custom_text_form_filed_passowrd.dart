import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class CustomTextFormFiledPassowrd extends StatefulWidget {
  const CustomTextFormFiledPassowrd({super.key, required this.onChanged});

  
  
  final void Function(String) onChanged;

  @override
  State<CustomTextFormFiledPassowrd> createState() => _CustomTextFormFiledPassowrdState();
}

class _CustomTextFormFiledPassowrdState extends State<CustomTextFormFiledPassowrd> {
  
  IconData iconData = FontAwesomeIcons.eyeSlash;
  bool obscureText = true;

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
      
      onChanged:widget.onChanged,
      obscureText: obscureText,
      decoration:  InputDecoration(
        hintText: "Password",
    
        hintStyle: const TextStyle(
          color: Colors.grey
        ),
        suffixIcon: IconButton(
          onPressed: (){
            if(obscureText == true){
    
              obscureText = false;
    
              
              iconData = FontAwesomeIcons.eye;
              
    
              setState(() {
                
              });
            }
    
            else{
              obscureText = true;
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