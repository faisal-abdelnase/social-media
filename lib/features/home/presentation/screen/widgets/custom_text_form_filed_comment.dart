import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_media_app/core/firebase/firestory.dart';
import 'package:social_media_app/core/provider/user_provider.dart';

class CommentTextFormFiled extends StatefulWidget {
  const CommentTextFormFiled({
    super.key, required this.postID,
  });

  final String postID;

  @override
  State<CommentTextFormFiled> createState() => _CommentTextFormFiledState();
}

class _CommentTextFormFiledState extends State<CommentTextFormFiled> {

  TextEditingController comment = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final userData= Provider.of<UserProvider>(context);
    return SizedBox(
      width: 290,
      child: TextFormField(
        controller: comment,
        decoration: InputDecoration(
    
          hintText: "add comment",
          hintStyle: const TextStyle(
            color: Colors.grey
          ),
    
          suffixIcon: IconButton(
            onPressed: (){

              if(comment.text != ''){
                  FireStoreMethod().addCommetn(
                    comment: comment.text, 
                    userImage: userData.getUser!.userImage, 
                    uID: userData.getUser!.uID, 
                    postID: widget.postID);

                    comment.text = "";
              }

                
            }, 
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