import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:social_media_app/core/models/user_model.dart';

class FireStoreMethod{

  // get user data

  Future<UserModel> userDetails() async{

    var user = await FirebaseFirestore.instance.
    collection("users").doc(FirebaseAuth.instance.currentUser!.uid).get();
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
}