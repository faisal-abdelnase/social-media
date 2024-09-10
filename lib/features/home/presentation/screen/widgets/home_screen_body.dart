import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:social_media_app/features/auth/presentation/views/login.dart';
import 'package:social_media_app/features/home/presentation/screen/widgets/posts.dart';

class HomeScreenBody extends StatefulWidget {
  const HomeScreenBody({super.key});

  @override
  State<HomeScreenBody> createState() => _HomeScreenBodyState();
}

class _HomeScreenBodyState extends State<HomeScreenBody> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Instagram", 
                  style: TextStyle(
                    fontSize: 32,
                  ),
                  ),
          
                  IconButton(
                    onPressed: ()async{
                      await FirebaseAuth.instance.signOut();
                      Navigator.pushNamed(context, Login.id);
                    }, 
                    icon: const Icon(
                      Icons.logout,
                      size: 24,
                      ),
                      ),
          
                ],
              ),
          
              const SizedBox(
                height: 30,
              ),
          
              const CircleAvatar(
                backgroundColor: Colors.red,
                radius: 54,
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage("assets/images/1.jpg"),
                  ),
              ),
          
              const Align(
                alignment: Alignment(-.7, -0.5),
                child: Text("S"),
                ),
          
              
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 4,
                itemBuilder: (context, index){
                  return const Posts();
                })
              
            ],
          ),
        ),
      ),
    );
  }
}

