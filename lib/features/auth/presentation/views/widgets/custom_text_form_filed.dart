import 'package:flutter/material.dart';

class CustomTextFormFiled extends StatelessWidget {
  const CustomTextFormFiled({
    super.key, required this.hintText, required this.iconData, required this.onFieldSubmitted,
  });

  final void Function(String) onFieldSubmitted;

  final String hintText;
  final IconData iconData;

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

        onFieldSubmitted: onFieldSubmitted,


        decoration:  InputDecoration(
          hintText: hintText,
      
          hintStyle: const TextStyle(
            color: Colors.grey
          ),
          suffixIcon: Icon(iconData),
                
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