import 'package:flutter/material.dart';

class CustomTextFormFiled extends StatelessWidget {
  const CustomTextFormFiled({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 290,
      child: TextFormField(
        decoration: InputDecoration(
    
          hintText: "add comment",
          hintStyle: const TextStyle(
            color: Colors.grey
          ),
    
          suffixIcon: IconButton(
            onPressed: (){}, 
            icon: const Icon(
              Icons.send,
              color: Colors.blue,
              ),
              ),
    
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.white,
            ),
    
            borderRadius: BorderRadius.circular(8)
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.blue
            ),
    
            borderRadius: BorderRadius.circular(8)
          ),
        ),
      ),
    );
  }
}