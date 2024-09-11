import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_media_app/core/provider/user_provider.dart';
import 'package:social_media_app/features/add_post/presentation/views/add_post_page.dart';
import 'package:social_media_app/features/home/presentation/screen/widgets/home_screen_body.dart';
import 'package:social_media_app/features/profile_Page/presentation/views/profile_page.dart';
import 'package:social_media_app/features/search_page/presentation/views/search_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static String id  = "HomePage";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int currentIndex = 0;

  @override
  void initState() {
    final userData = Provider.of<UserProvider>(context, listen: false).fetchUser();
    super.initState();
  }
  
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
            SearchPage(),
            AddPostPage(),
            ProfilePage(),
          ],
        ),

    );
  }
}