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

      body: const Column(
        children: [
          ChatBuble(),
          ChatBuble(),
          ChatBubleForFriends(),
          ChatBubleForFriends(),
        ],
      ),
    );
  }
}

