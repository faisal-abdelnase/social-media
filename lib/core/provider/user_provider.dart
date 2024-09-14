

import 'package:flutter/material.dart';
import 'package:social_media_app/core/firebase/firestory.dart';
import 'package:social_media_app/core/models/user_model.dart';

class UserProvider with ChangeNotifier {

  UserModel? userModel;
  UserModel? get getUser{
    return userModel;
  }

  void fetchUser() async{

    userModel = await FireStoreMethod().userDetails();

    notifyListeners();

  }

}