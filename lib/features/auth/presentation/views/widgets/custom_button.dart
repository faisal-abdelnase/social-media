import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
        padding: const EdgeInsets.symmetric(horizontal: 140, vertical: 10),
      ),
      onPressed: (){}, 
      child: const Text("Sing up", 
      style: TextStyle(
        color: Colors.white,
        fontSize: 18,
      ),
      ),
      );
  }
}

