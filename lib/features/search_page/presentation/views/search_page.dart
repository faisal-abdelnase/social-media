import 'package:flutter/material.dart';
import 'package:social_media_app/features/search_page/presentation/views/chat_page.dart';
import 'package:social_media_app/features/search_page/presentation/views/search_profile_page.dart';

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
              child: SizedBox(
              
                child: ListView.builder(
                  itemCount: 3,
                  itemBuilder: (context, index){
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => const SearchProfilePage()));
                        },
                        child: Row(
                          
                          children: [
                            const CircleAvatar(
                              backgroundImage: AssetImage("assets/images/1.jpg"),
                            ),
                        
                            const SizedBox(
                              width: 20,
                            ),
                        
                            const Text("Faisal", 
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),),
                        
                            Expanded(
                              child: Align(
                                alignment: Alignment.topRight,
                                child: IconButton(
                                  onPressed: (){
                                    Navigator.of(context).push(
                                      MaterialPageRoute(builder: (context) => const ChatPage()));
                                  }, 
                                  icon: const Icon(Icons.chat_bubble_outline)),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  }),
              ),
            )
          ],
        ),
      ),
    );
  }
}