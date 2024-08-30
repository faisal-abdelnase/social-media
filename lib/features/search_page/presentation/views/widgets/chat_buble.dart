import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ChatBuble extends StatelessWidget {
  const ChatBuble({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(top: 8, bottom: 8, right:  64, left: 16),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.blue
                ),
            
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Text("hi", 
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold
              ),),
              
            ),
        
            Text(
              DateFormat("HH:MM a").format(DateTime.now()),
              ),
          ],
        ),
      ),
    );
  }
}