import 'package:flutter/material.dart';
import 'package:social_media_app/features/search_page/presentation/views/widgets/chat_buble.dart';
import 'package:social_media_app/features/search_page/presentation/views/widgets/chat_buble_for_friends.dart';


class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Row(
          children: [

            CircleAvatar(
              backgroundImage: AssetImage("assets/images/1.jpg"),
            ),
            SizedBox(
              width: 20,
            ),
            Text("Faisal"),
          ],
        ),
      ),

      body: Column(
        children: [
          const Expanded(child: ChatBuble()),
          const ChatBuble(),
          const ChatBubleForFriends(),
          const ChatBubleForFriends(),


          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Send Message",
                hintStyle: const TextStyle(
                  color: Colors.grey
                ),

                suffixIcon: IconButton(
                  onPressed: (){

                  }, 
                  icon: const Icon(
                    Icons.send,
                    color: Colors.blue,
                    ),
                    ),

                    prefixIcon: IconButton(
                      onPressed: (){}, 
                      icon: const Icon(
                        Icons.image,
                        color: Colors.blue,
                        ),
                        ),
            
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.grey
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),


                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.blue
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

