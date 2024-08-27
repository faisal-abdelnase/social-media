import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomIconButtonLove extends StatefulWidget {
  const CustomIconButtonLove({
    super.key,
  });

  @override
  State<CustomIconButtonLove> createState() => _CustomIconButtonLoveState();
}

class _CustomIconButtonLoveState extends State<CustomIconButtonLove> {

  Color iconColor = Colors.white;
  @override
  Widget build(BuildContext context) {
    return IconButton(
          onPressed: (){
            if(iconColor == Colors.white){
              iconColor = Colors.red;
              setState(() {
              
              });
            }
            
            else{
              iconColor = Colors.white;
              setState(() {
                
              });
            }
        }, 
        icon: Icon(
            FontAwesomeIcons.solidHeart,
            color: iconColor,
    ),
                );
  }
}