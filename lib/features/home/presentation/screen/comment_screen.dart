import 'package:flutter/material.dart';
import 'package:social_media_app/features/home/presentation/screen/widgets/custom_icon_button_love.dart';
import 'package:social_media_app/features/home/presentation/screen/widgets/custom_text_form_filed_comment.dart';

class CommentScreen extends StatefulWidget {
  const CommentScreen({super.key});

  @override
  State<CommentScreen> createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {

  Color iconColor = Colors.white;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Comment"),
      ),

      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage("assets/images/1.jpg"),
                      ),
              
                      SizedBox(width: 15,),
              
                      Column(
                        children: [
                          Text("Faisal", 
                          style: TextStyle(
                            fontSize: 18,
                          ),),
                          Text("Good", 
                          style: TextStyle(
                            fontSize: 18,
                          ),),
                        ],
                      ),
              
                      SizedBox(width: 185,),
              
                      CustomIconButtonLove(),
                    ],
                  ),
                ],
              ),
            ),
        
            Spacer(),
        
        
        
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage("assets/images/1.jpg"),
                  ),

                  

                  CustomTextFormFiled(),
                
              ],
            ),
        
        
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}

