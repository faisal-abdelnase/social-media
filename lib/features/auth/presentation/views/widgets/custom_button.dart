import 'package:flutter/material.dart';
import 'package:social_media_app/features/home/presentation/screen/home_screen.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key, required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
        padding: const EdgeInsets.symmetric(horizontal: 140, vertical: 10),
      ),
      onPressed: (){
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const HomeScreen()));
      }, 
      child: Text(text, 
      style: const TextStyle(
        color: Colors.white,
        fontSize: 18,
      ),
      ),
      );
  }
}

