import 'package:flutter/material.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const CircleAvatar(
      backgroundColor: Colors.white,
      radius: 37,
      child: CircleAvatar(
        radius: 35,
        backgroundImage: AssetImage("assets/images/1.jpg"),
      ),
    ),
    
    Positioned(
      top: 40,
      left: 40,
      child: IconButton(
      
        onPressed: (){}, 
        icon: const Icon(
          Icons.add_circle_outline_rounded,
          color: Colors.white,
          ),
      
        ),
    ),
      ],
    );
  }
}