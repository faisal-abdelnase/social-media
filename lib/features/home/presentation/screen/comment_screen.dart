import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_media_app/core/provider/user_provider.dart';
import 'package:social_media_app/features/home/presentation/screen/widgets/custom_icon_button_love.dart';

import 'package:social_media_app/features/home/presentation/screen/widgets/custom_text_form_filed_comment.dart';

class CommentScreen extends StatefulWidget {
  const CommentScreen({super.key, required this.postID, });

  final String postID;

  @override
  State<CommentScreen> createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {

  Color iconColor = Colors.white;
  @override
  Widget build(BuildContext context) {
    final userData= Provider.of<UserProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Comment"),
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            children: [
          
              SizedBox(
                height: 650,
                child: ListView.builder(
                  shrinkWrap: true,
                  
                  itemCount: 10,
                  itemBuilder: (context, index) {
                  return const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: PostComments(),
                  );
                },
                ),
              ),
          
              
          
          
          
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(userData.getUser!.userImage),
                    ),
                        
                    
                        
                    CommentTextFormFiled(postID: widget.postID,),
                  
                ],
              ),
          
          
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PostComments extends StatelessWidget {
  const PostComments({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return  Row(
      
      children: [
        const CircleAvatar(
          radius: 30,
          backgroundImage: AssetImage("assets/images/1.jpg"),
        ),
                  
        const SizedBox(width: 15,),
                  
        const Column(
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
                  
        const SizedBox(width: 185,),
                  
        CustomIconButtonLove(
          onPressed: () {
          
        },
        iconColor: Colors.white,
        ),
      ],
    );
  }
}

