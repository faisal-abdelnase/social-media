import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_media_app/core/provider/user_provider.dart';
import 'package:social_media_app/features/profile_Page/presentation/views/widgets/custom_profile_info.dart';
import 'package:social_media_app/features/profile_Page/presentation/views/widgets/profile_image.dart';

class ProfilePageBody extends StatelessWidget {
  const ProfilePageBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
  final userData= Provider.of<UserProvider>(context);
    
    return SingleChildScrollView(
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
      
              CustomProfileInfo(num: 2, text: "Posts",),
              CustomProfileInfo(num: 1, text: "Followers",),
              CustomProfileInfo(num: 1, text: "Following",),
      
              
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
            ),
            onPressed: (){}, 
            child: const Text("Edit profile", 
            style: TextStyle(
              color: Colors.white
            ),),
            ),
      
            const SizedBox(
              height: 10,
            ),
      
            const Divider(thickness: 2,),


            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisSpacing: 1,
              mainAxisSpacing: 1,
              childAspectRatio: 35/33,
              crossAxisCount: 2,
              children: List.generate(5, (index){
                return Image.asset("assets/images/images.jpg");
              },
              ),
            ),
      
            
        ],
      ),
    );
  }
}

