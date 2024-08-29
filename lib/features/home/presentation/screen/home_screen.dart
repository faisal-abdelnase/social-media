import 'package:flutter/material.dart';
import 'package:social_media_app/features/add_post/presentation/views/add_post_page.dart';
import 'package:social_media_app/features/home/presentation/screen/widgets/home_screen_body.dart';
import 'package:social_media_app/features/profile_Page/presentation/views/profile_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int currentIndex = 0;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedIconTheme: const IconThemeData(
          color: Colors.white,
        ),

        selectedItemColor: Colors.white,

        unselectedIconTheme: const IconThemeData(
          color: Colors.white
        ),


        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "HOME",
            ),

            BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "Search",
            
            ),

            BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: "Add Post",
            ),

            BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
            ),
        ],
        currentIndex: currentIndex,
        onTap: (value) {
          currentIndex = value;
          setState(() {
            
          });
        },
        ),

        body: IndexedStack(
          index: currentIndex,
          children: const [
            HomeScreenBody(),
            AddPostPage(),
            ProfilePage(),
          ],
        ),

    );
  }
}