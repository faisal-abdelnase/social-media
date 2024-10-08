import 'package:flutter/material.dart';
import 'package:social_media_app/features/auth/presentation/views/login.dart';
import 'package:social_media_app/features/home/presentation/screen/home_screen.dart';
import 'package:social_media_app/features/profile_Page/presentation/views/widgets/profile_page_body.dart';


class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key, required this.userid});

  final String userid;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        leading: IconButton(
          onPressed: (){
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const HomeScreen()));
          }, 
          icon: const Icon(Icons.arrow_back)),
        actions: [
          IconButton(
            onPressed: (){
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const Login()));
            }, 
            icon: const Icon(Icons.logout),
            ),
        ],
      ),

      body: ProfilePageBody(userid: userid,),
    );
  }
}

