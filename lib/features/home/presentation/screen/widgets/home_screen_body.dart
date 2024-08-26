import 'package:flutter/material.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
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
                    width: 10,
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
              )

            
          ],
        ),
      ),
    );
  }
}