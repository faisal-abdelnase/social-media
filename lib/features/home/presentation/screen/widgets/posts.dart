import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:social_media_app/features/home/presentation/screen/comment_screen.dart';
import 'package:social_media_app/features/home/presentation/screen/widgets/custom_icon_button_love.dart';

class Posts extends StatelessWidget {
  const Posts({super.key, required this.posts});

  final Map<String, dynamic> posts;

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
              backgroundImage: NetworkImage(posts['userImage']),
            ),
            
            const SizedBox(
              width: 15,
            ),
            
            Text(posts['userName'],
            style: const TextStyle(
              fontSize: 24
            ),),
              ],
            ),
            
            IconButton(
              onPressed: (){}, 
              icon: const Icon(Icons.remove))
          ],
        ),

        const SizedBox(
          height: 20,
        ),
  
                    
            
          Container(
            height: 400,
            width: double.infinity,
            // margin: const EdgeInsets.symmetric( horizontal: 8),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(posts['ImagePost']),
                fit: BoxFit.cover
                ),
            ),
          ),
          
          Row(
            children: [
              
              const CustomIconButtonLove(),

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
                const Text("0likes", 
                style: TextStyle(
                  fontSize: 18,
                ),),

                const SizedBox(
                        height: 15,
                      ),


                Text(posts['des'], 
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
                        MaterialPageRoute(builder: (context) => const CommentScreen()));
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