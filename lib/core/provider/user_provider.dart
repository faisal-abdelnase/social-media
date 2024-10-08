

import 'package:flutter/material.dart';
import 'package:social_media_app/core/firebase/firestory.dart';
import 'package:social_media_app/core/models/user_model.dart';

class UserProvider with ChangeNotifier {

  UserModel? userModel;
  UserModel? get getUser{
    return userModel;
  }

  void fetchUser({required userid}) async{

    userModel = await FireStoreMethod().userDetails(userid: userid);

    notifyListeners();

  }


  void increaseFollowers(){

    getUser!.followers.length++;
    notifyListeners();
  }


  void decreaseFollowers(){

    getUser!.followers.length--;
    notifyListeners();
  }

}