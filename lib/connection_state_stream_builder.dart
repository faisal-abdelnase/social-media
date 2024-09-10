import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:social_media_app/features/auth/presentation/views/sing_up.dart';
import 'package:social_media_app/features/home/presentation/screen/home_screen.dart';

class ConnectionStateStreamBuilder extends StatelessWidget {
  const ConnectionStateStreamBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      // see user state is sign in or sign out
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if(snapshot.connectionState == ConnectionState.waiting){
          return const Center(child: CircularProgressIndicator());
        }
        if(snapshot.hasError){
          return const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.error),
                Text("Error, try again", style: TextStyle(fontSize: 24),)
              ],
            ),
          );
        }
    
        if(snapshot.data == null){
          return const SingUp();
        }
        if(snapshot.hasData){
          return const HomeScreen();
        }
    
        return const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.error),
                Text("Error, try again", style: TextStyle(fontSize: 24),)
              ],
            ),
          );
      }, 
      );
  }
}
