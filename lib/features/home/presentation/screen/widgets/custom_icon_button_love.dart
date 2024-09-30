import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class CustomIconButtonLove extends StatelessWidget {
  const CustomIconButtonLove({
    super.key, required this.onPressed, required this.iconColor,
  });
  final Function() onPressed;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return IconButton(
          onPressed: onPressed,
        icon: Icon(
            FontAwesomeIcons.solidHeart,
            color: iconColor,
    ),
                );
  }
}