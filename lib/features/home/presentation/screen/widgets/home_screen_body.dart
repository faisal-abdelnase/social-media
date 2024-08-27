import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:social_media_app/features/home/presentation/screen/comment_screen.dart';
import 'package:social_media_app/features/home/presentation/screen/widgets/custom_icon_button_love.dart';

class HomeScreenBody extends StatefulWidget {
  const HomeScreenBody({super.key});

  @override
  State<HomeScreenBody> createState() => _HomeScreenBodyState();
}

class _HomeScreenBodyState extends State<HomeScreenBody> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Instagram", 
                    style: TextStyle(
                      fontSize: 32,
                    ),
                    ),
            
                    IconButton(
                      onPressed: (){}, 
                      icon: const Icon(
                        Icons.message,
                        size: 24,
                        ),
                        ),
            
                  ],
                ),
            
                const SizedBox(
                  height: 30,
                ),
            
                const CircleAvatar(
                  backgroundColor: Colors.red,
                  radius: 54,
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage("assets/images/1.jpg"),
                    ),
                ),
            
                const Align(
                  alignment: Alignment(-.7, -0.5),
                  child: Text("S"),
                  ),
            
                  const SizedBox(
                  height: 40,
                ),
            
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Row(
                        children: [
                          CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage("assets/images/1.jpg"),
                      ),
                      
                      SizedBox(
                        width: 15,
                      ),
                      
                      Text("Faisal",
                      style: TextStyle(
                        fontSize: 24
                      ),),
                        ],
                      ),
            
                      IconButton(
                        onPressed: (){}, 
                        icon: const Icon(Icons.remove))
                    ],
                  ),
            
                    
            
                
              ],
            ),
          ),
      
          Container(
            height: 400,
            width: double.infinity,
            margin: const EdgeInsets.symmetric( horizontal: 8),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/1.jpg"),
                fit: BoxFit.cover
                ),
            ),
          ),
          
          Row(
            children: [
              
              const SizedBox(
                width: 10,
              ),
              const CustomIconButtonLove(),

            IconButton(
            onPressed: (){
            
            }, 
            icon: const Icon(
              Icons.message,
              ),
            ),
            ],
          ),

          Padding(
            padding: const EdgeInsets.only(left: 24, bottom: 32),
            child: Column(

              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("0likes", 
                style: TextStyle(
                  fontSize: 18,
                ),),

                const SizedBox(
                        height: 15,
                      ),


                const Text("nice photot", 
                style: TextStyle(
                  fontSize: 18
                ),
                ),

                const SizedBox(
                        height: 15,
                      ),

                
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => const CommentScreen()));
                    },
                    child: const Text("Add comment", 
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey,
                    ),
                    ),
                    ),

                    const SizedBox(
                        height: 15,
                      ),

                    Text(DateFormat("EEE,MMM d").format(DateTime.now()), 
                    style: const TextStyle(
                      fontSize: 18,
                    ),),


              
            
              ],
            ),
          )

            
        ],
      ),
    );
  }
}

