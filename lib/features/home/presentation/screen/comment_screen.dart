import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_media_app/core/provider/user_provider.dart';
import 'package:social_media_app/features/home/presentation/screen/widgets/custom_text_form_filed_comment.dart';
import 'package:social_media_app/features/home/presentation/screen/widgets/post_comments.dart';


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
    final userData = Provider.of<UserProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Comment"),
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [

            Expanded(
              child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection("posts")
                    .doc(widget.postID)
                    .collection("comments").orderBy('date' ,descending: true)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  return ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      Map<String, dynamic> comment = snapshot.data!.docs[index].data();
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: PostComments(comment: comment),
                      );
                    },
                  );
                }
              ),
            ),

          
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(userData.getUser!.userImage),
                  ),
                  Expanded(
                    child: CommentTextFormFiled(postID: widget.postID),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

