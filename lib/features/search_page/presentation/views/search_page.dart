import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:social_media_app/features/profile_Page/presentation/views/profile_page.dart';
import 'package:social_media_app/features/search_page/presentation/views/chat_page.dart';


class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

  final searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [

            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: searchController,

              onChanged: (value) {
                setState(() {
                  
                });
              },
      
              decoration: InputDecoration(
                hintText: "search",
                hintStyle: const TextStyle(
                  color: Colors.grey,
                  
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.grey
                  ),
                  borderRadius: BorderRadius.circular(8)
                ),

                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.blue,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),


            Expanded(
              child: FutureBuilder(
                future: FirebaseFirestore.instance.
                collection("users").
                where("userName", isEqualTo: searchController.text).get(),
                builder: (context,snapshot) {
                  if(snapshot.connectionState == ConnectionState.waiting){
                    return const Center(child: CircularProgressIndicator(),);
                  }
                  return ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index){

                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        child: ListTile(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) =>  ProfilePage(
                                  userid: snapshot.data!.docs[index]["uID"],)));
                          },
                          leading: CircleAvatar(
                              backgroundImage: NetworkImage(snapshot.data!.docs[index]["userImage"]),
                            ),
                                          
                          title: Text(snapshot.data!.docs[index]["userName"], 
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                            ),
                                          
                          trailing: IconButton(
                                  onPressed: (){
                                    Navigator.of(context).push(
                                      MaterialPageRoute(builder: (context) => const ChatPage()));
                                  }, 
                                  icon: const Icon(Icons.chat_bubble_outline)),
                        ),
                      );
                    });
                }
              ),
            )
          ],
        ),
      ),
    );
  }
}





