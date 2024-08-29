import 'package:flutter/material.dart';

class CustomProfileInfo extends StatelessWidget {
  const CustomProfileInfo({
    super.key, required this.num, required this.text,
  });

  final int num;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(num.toString(), 
        style: const TextStyle(
          fontSize: 18,
        ),),
    
        Text(text, 
        style: const TextStyle(
          fontSize: 18,
        ),),
    
      ],
    );
  }
}

