import 'package:flutter/material.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({
    super.key, required this.userImage,
  });

  final String userImage;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
    CircleAvatar(
      backgroundColor: Colors.white,
      radius: 37,
      child: CircleAvatar(
        radius: 35,
        backgroundImage: NetworkImage(userImage),
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