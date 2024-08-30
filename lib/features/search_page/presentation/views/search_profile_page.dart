import 'package:flutter/material.dart';
import 'package:social_media_app/features/profile_Page/presentation/views/widgets/custom_profile_info.dart';
import 'package:social_media_app/features/profile_Page/presentation/views/widgets/profile_image.dart';

class SearchProfilePage extends StatefulWidget {
  const SearchProfilePage({super.key});

  @override
  State<SearchProfilePage> createState() => _SearchProfilePageState();
}

class _SearchProfilePageState extends State<SearchProfilePage> {

  String text = "follow";
  Color colorButton =  const Color.fromARGB(255, 82, 81, 81);
  int followers = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),

      body: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
      
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
      
              const ProfileImage(),
      
              const CustomProfileInfo(num: 2, text: "Posts",),
              CustomProfileInfo(num: followers, text: "Followers",),
              const CustomProfileInfo(num: 1, text: "Following",),
      
              
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(left: 8, top: 8, bottom: 16),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text("Faisal", 
              style: TextStyle(
                fontSize: 24,
              ),
              ),
            ),
          ),
      
          ElevatedButton(

            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 150, vertical: 10),
              backgroundColor: colorButton,
            ),
            onPressed: (){
              if(text == "follow"){
                text = "unfollow";
                colorButton = const Color.fromARGB(255, 219, 100, 92);

                setState(() {
                  
                });

                followers++;
              }

              else{
                text = "follow";
                colorButton =  const Color.fromARGB(255, 82, 81, 81);
                followers--;
                setState(() {
                  
                });
              }
            }, 
            child: Text(text, 
            style: const TextStyle(
              color: Colors.white
            ),),
            ),
      
            const SizedBox(
              height: 10,
            ),
      
            const Divider(),
      
            SizedBox(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 3),
                      child: Image.asset("assets/images/images.jpg"),
                    );
                  },
                ),
            ),
        ],
      ),
    ),
    );
  }
}