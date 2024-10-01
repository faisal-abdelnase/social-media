import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:social_media_app/core/firebase/firestory.dart';
import 'package:social_media_app/features/home/presentation/screen/comment_screen.dart';
import 'package:social_media_app/features/home/presentation/screen/widgets/custom_icon_button_love.dart';

class Posts extends StatefulWidget {
  const Posts({super.key, required this.posts});

  final Map<String, dynamic> posts;

  @override
  State<Posts> createState() => _PostsState();
}

class _PostsState extends State<Posts> {
  Color iconColor = Colors.white;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                
            CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(widget.posts['userImage']),
            ),
            
            const SizedBox(
              width: 15,
            ),
            
            Text(widget.posts['userName'],
            style: const TextStyle(
              fontSize: 24
            ),),
              ],
            ),
            
            IconButton(
              onPressed: (){
                FireStoreMethod().deletePost(post: widget.posts);
              }, 
              icon: const Icon(Icons.remove))
          ],
        ),

        const SizedBox(
          height: 20,
        ),
  
                    
            
          Container(
            height: 400,
            width: double.infinity,
            
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(widget.posts['ImagePost']),
                fit: BoxFit.cover
                ),
            ),
          ),
          
          Row(
            children: [
              

              CustomIconButtonLove(
                onPressed: (){
                      FireStoreMethod().addPost(postMap: widget.posts);
                  
                },

                iconColor:(widget.posts['likes'] as List).
                contains(FirebaseAuth.instance.currentUser!.uid) 
                  ? Colors.red 
                  : Colors.white

        ),

            IconButton(
            onPressed: (){
            
            }, 
            icon: const Icon(
              Icons.message,
              ),
            ),
            ],
          ),

          Padding(
            padding: const EdgeInsets.only(left: 8, bottom: 32),
            child: Column(

              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("${widget.posts["likes"].length} likes", 
                style: const TextStyle(
                  fontSize: 18,
                ),),

                const SizedBox(
                        height: 15,
                      ),


                Text(widget.posts['des'], 
                style: const TextStyle(
                  fontSize: 18
                ),
                ),

                const SizedBox(
                        height: 15,
                      ),

                
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => CommentScreen(postID: widget.posts['postID'],)));
                    },
                    child: const Text("Add comment", 
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey,
                    ),
                    ),
                    ),

                    const SizedBox(
                        height: 15,
                      ),

                    Text(DateFormat("EEE,MMM d").format(DateTime.now()), 
                    style: const TextStyle(
                      fontSize: 18,
                    ),),
            
              ],
            ),
          )

            
      ],
    );



    
  }
}