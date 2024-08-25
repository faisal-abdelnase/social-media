import 'package:flutter/material.dart';
import 'package:social_media_app/features/auth/presentation/views/sing_up.dart';

void main() {
  runApp(const Intstagram());
}

class Intstagram extends StatelessWidget {
  const Intstagram({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black
      ),

      home: const SingUp(),

    );
  }
}