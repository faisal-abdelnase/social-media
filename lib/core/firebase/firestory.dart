import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:social_media_app/core/models/user_model.dart';
import 'package:uuid/uuid.dart';

class FireStoreMethod{

  // get user data

  Future<UserModel> userDetails({required userid}) async{

    var user = await FirebaseFirestore.instance.
    collection("users").doc(userid).get();
    return UserModel.fromJeson(user);
  }



  // add post

  addPost({required Map postMap}) async{
    if(postMap["likes"].contains(FirebaseAuth.instance.currentUser!.uid)){
      await FirebaseFirestore.instance.
      collection("posts").doc(postMap["postID"]).update({
        'likes' : FieldValue.arrayRemove([FirebaseAuth.instance.currentUser!.uid]),
      });
    }


    else{
      await FirebaseFirestore.instance.
      collection("posts").doc(postMap["postID"]).update({
        'likes' : FieldValue.arrayUnion([FirebaseAuth.instance.currentUser!.uid]),
      });
    }
  }


  // delete post

  deletePost({required Map post}) async{
    if(FirebaseAuth.instance.currentUser!.uid == post["uid"]){
      await FirebaseFirestore.instance.collection("posts").doc(post['postID']).delete();
    }
  }


  // add comments

  addCommetn({required comment, required userImage, required uID, required postID, required userName})async{

        final uuid = Uuid().v4();

        await FirebaseFirestore.instance.
        collection("posts").doc(postID).
        collection('comments').doc(uuid).set({
          "comment" : comment,
          "userImage" : userImage,
          "uID" : uID,
          "postID": postID,
          "commentID" : uuid,
          "userName" : userName,
          "date" : Timestamp.now(),
        });

        
  }





  // follow to user

  followUser({required userId}) async{

    // update my profile
    await FirebaseFirestore.instance.
    collection("users").
    doc(FirebaseAuth.instance.currentUser!.uid).update({
      'folloeing' : FieldValue.arrayUnion([userId])
    });



    // update profile friend 
    await FirebaseFirestore.instance.
    collection("users").
    doc(userId).update({
      'followers' : FieldValue.arrayUnion([FirebaseAuth.instance.currentUser!.uid])
    });
  }





 // un follow to user

  unFollowUser({required userId}) async{

    // update my profile
    await FirebaseFirestore.instance.
    collection("users").
    doc(FirebaseAuth.instance.currentUser!.uid).update({
      'folloeing' : FieldValue.arrayRemove([userId])
    });



    // update profile friend 
    await FirebaseFirestore.instance.
    collection("users").
    doc(userId).update({
      'followers' : FieldValue.arrayRemove([FirebaseAuth.instance.currentUser!.uid])
    });
  }
}