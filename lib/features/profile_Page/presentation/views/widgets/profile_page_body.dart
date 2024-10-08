import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_media_app/core/firebase/firestory.dart';
import 'package:social_media_app/core/provider/user_provider.dart';
import 'package:social_media_app/features/profile_Page/presentation/views/widgets/custom_profile_info.dart';
import 'package:social_media_app/features/profile_Page/presentation/views/widgets/profile_image.dart';

class ProfilePageBody extends StatefulWidget {
  const ProfilePageBody({
    super.key, required this.userid,
  });

  final String userid;

  @override
  State<ProfilePageBody> createState() => _ProfilePageBodyState();
}

class _ProfilePageBodyState extends State<ProfilePageBody> {


  late List following;
  late bool inFollowing;
  bool isLoding = false;
  int postCount = 0;

  void fetchCurrentUser() async {
    setState(() {
      isLoding = true;
    });
    
    var snapshot = await FirebaseFirestore.instance.
    collection("users").doc(FirebaseAuth.instance.currentUser!.uid).get();


    following = snapshot.data()!["folloeing"];
    setState(() {
      inFollowing = following.contains(widget.userid);
      isLoding = false;
    });

    // number of posts

    var snap = await FirebaseFirestore.instance.
    collection("posts").
    where('uid', isEqualTo: widget.userid).get();

    postCount = snap.docs.length;
  }


  @override
  void initState() {
    Provider.of<UserProvider>(context, listen: false).fetchUser(userid: widget.userid);
    super.initState();

    fetchCurrentUser();
  }
  
  @override
  Widget build(BuildContext context) {
final userData= Provider.of<UserProvider>(context);
  
    
    return isLoding == true? const Center(child: CircularProgressIndicator()) : SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
      
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
      
              ProfileImage(userImage: userData.getUser!.userImage,),
      
              CustomProfileInfo(num: postCount, text: "Posts",),
              CustomProfileInfo(num: userData.getUser!.followers.length, text: "Followers",),
              CustomProfileInfo(num: userData.getUser!.folloeing.length, text: "Following",),
      
              
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8, top: 8, bottom: 16),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(userData.getUser!.userName, 
              style: const TextStyle(
                fontSize: 24,
              ),
              ),
            ),
          ),
      
          ElevatedButton(

            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 150, vertical: 10),
              backgroundColor: inFollowing == true? Colors.red 
              : Colors.grey[900],
            ),
            onPressed: (){
              if(inFollowing == true){
                // unFollow
                
                FireStoreMethod().unFollowUser(userId: widget.userid);
                userData.decreaseFollowers();

                setState(() {
                  inFollowing = false;
                });


                
                
              }

              else{
                // follow
                setState(() {
                  inFollowing = true;
                });
                FireStoreMethod().followUser(userId: widget.userid);
                userData.increaseFollowers();
              }


            }, 
            child: widget.userid == FirebaseAuth.instance.currentUser!.uid?
            const Text("Edit profile", 
            style: TextStyle(
              color: Colors.white
            ),)

            : inFollowing == true ? const Text("unFollow", 
            style: TextStyle(
              color: Colors.white
            ),)
            : const Text("Follow", 
            style: TextStyle(
              color: Colors.white
            ),)
            ),
      
            const SizedBox(
              height: 10,
            ),
      
            const Divider(thickness: 3,),


            FutureBuilder(
              future: FirebaseFirestore.instance.
              collection("posts").
              where("uid", isEqualTo: widget.userid).get(),
              builder: (context, snapshot) {
                if(snapshot.connectionState == ConnectionState.waiting){
                  return const Center(child: CircularProgressIndicator(),);
                }

                if(snapshot.hasError){
                  return const Center(child: Text("Erorr"),);
                }
                return GridView.count(
                  padding: const EdgeInsets.all(8),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 35/33,
                  crossAxisCount: 2,
                  children: List.generate(snapshot.data!.docs.length, (index){
                    return Image.network(snapshot.data!.docs[index]["ImagePost"], height: 100, width: 100, fit: BoxFit.fill,);
                  },
                  ),
                );
              }
            ),
      
            
        ],
      ),
    );
  }
}

