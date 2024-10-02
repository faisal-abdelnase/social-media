import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_media_app/core/provider/user_provider.dart';
import 'package:social_media_app/features/auth/presentation/views/login.dart';
import 'package:social_media_app/features/home/presentation/screen/widgets/posts.dart';

class HomeScreenBody extends StatefulWidget {
  const HomeScreenBody({super.key});

  @override
  State<HomeScreenBody> createState() => _HomeScreenBodyState();
}

class _HomeScreenBodyState extends State<HomeScreenBody> {

  @override
  void initState() {
    Provider.of<UserProvider>(context, listen: false).
    fetchUser(userid: FirebaseAuth.instance.currentUser!.uid);
    super.initState();
  }
  
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
          
              
              StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance.collection('posts').snapshots(),
                builder: (context, snapshot) {

                  if(snapshot.connectionState == ConnectionState.waiting){
                    return const CircularProgressIndicator();
                  }

                  if(snapshot.hasError){
                    return const Center(
                      child: Text("Erro", 
                      style: TextStyle(
                        color: Colors.red, 
                        fontSize: 24),));
                  }
                  
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index){
                      Map<String, dynamic> posts = 
                      snapshot.data!.docs[index].data() as Map<String, dynamic>;
                      return Posts(posts: posts,);
                    });
                }
              )
              
            ],
          ),
        ),
      ),
    );
  }
}

