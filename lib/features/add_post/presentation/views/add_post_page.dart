import 'package:flutter/material.dart';
import 'package:social_media_app/features/home/presentation/screen/home_screen.dart';


class AddPostPage extends StatelessWidget {
  const AddPostPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        automaticallyImplyLeading: false,
        title: const Text("New Post"),
        centerTitle: true,
        leading: IconButton(
          onPressed: (){
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const HomeScreen()));
          }, 
          icon: const Icon(
            Icons.close,
            ),),

            actions: [
              TextButton(
                onPressed: (){}, 
                child: const Text("Next", 
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 20
                ),))
            ],

      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Container(
              height: 350,
              width: double.infinity,
              color: Colors.red,
            ),
        
            IconButton(
              onPressed: (){}, 
              icon: const Icon(
                Icons.upload,
                size: 32,
                ),
                ),
        
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: const InputDecoration(
                  hintText: "add comment",
                  hintStyle: TextStyle(
                    color: Colors.grey,
                  ),
              
                  border: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}