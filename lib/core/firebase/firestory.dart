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
}