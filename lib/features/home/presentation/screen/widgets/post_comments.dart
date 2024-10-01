import 'package:flutter/material.dart';
import 'package:social_media_app/features/home/presentation/screen/widgets/custom_icon_button_love.dart';

class PostComments extends StatelessWidget {
  const PostComments({
    super.key, required this.comment,
  });

  final Map<String, dynamic> comment;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
          radius: 30,
          backgroundImage: NetworkImage(comment['userImage']),
        ),
        title: Text(comment["userName"], 
            style: const TextStyle(
              fontSize: 18,
            ),
            ),

        subtitle: Text(comment['comment'], 
            style: const TextStyle(
              fontSize: 18,
            ),
            ),

            trailing: CustomIconButtonLove(
                  onPressed: () {
                  
                },
                iconColor: Colors.white,
          ),
    );
  }
}

