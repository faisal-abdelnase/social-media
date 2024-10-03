import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:social_media_app/core/provider/user_provider.dart';
import 'package:social_media_app/core/show_snack_bar.dart';
import 'package:social_media_app/features/home/presentation/screen/home_screen.dart';
import 'package:uuid/uuid.dart';


class AddPostPage extends StatefulWidget {
  const AddPostPage({super.key});

  @override
  State<AddPostPage> createState() => _AddPostPageState();
}

class _AddPostPageState extends State<AddPostPage> {

  File? pickedImage;
  final des = TextEditingController();

  void SelectImage() async{

    var image = await ImagePicker().pickImage(source: ImageSource.gallery);
    var selected = File(image!.path);

    setState(() {
      pickedImage = selected;
    });
  }


  void uploadPost() async{
    final userProvider = Provider.of<UserProvider>(context, listen: false);

    try{

      // to give different id every image
        final uuId = const Uuid().v4();
        // to add image to storage
        final ref = FirebaseStorage.instance.ref()
        .child('postImage').child("${uuId}jpg");
        await ref.putFile(pickedImage!);
        final imageUrl = await ref.getDownloadURL();



      FirebaseFirestore.instance.collection("posts").doc(uuId).set(
        {
          "userName" : userProvider.getUser!.userName,
          "uid" : userProvider.getUser!.uID,
          "userImage" : userProvider.getUser!.userImage,
          "ImagePost" : imageUrl,
          "postID" : uuId,
          "des" : des.text,
          'likes' : [],
          'date' : Timestamp.now(),
        }
      );

      setState(() {
        pickedImage = null;
        des.text = "";
      });
      showSnaklBar(context, "Done");
    }on FirebaseException catch(e){
      showSnaklBar(context, e.toString());
    }
  }


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
                onPressed: (){
                  uploadPost();
                }, 
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
            
            pickedImage == null
            ? const SizedBox(height: 350,) 
            : Image.file(pickedImage!, 
            height: 350, 
            width: double.infinity,
            fit: BoxFit.fill,
            ),
        
            IconButton(
              onPressed: (){
                SelectImage();
              }, 
              icon: const Icon(
                Icons.upload,
                size: 32,
                ),
                ),
        
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: des,
                maxLines: 15,
                
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