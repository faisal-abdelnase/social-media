
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:social_media_app/connection_state_stream_builder.dart';
import 'package:social_media_app/core/provider/user_provider.dart';
import 'package:social_media_app/features/auth/presentation/manager/bloc/auth_bloc.dart';
import 'package:social_media_app/features/auth/presentation/views/login.dart';
import 'package:social_media_app/features/home/presentation/screen/home_screen.dart';
import 'package:social_media_app/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const Intstagram());
}

class Intstagram extends StatelessWidget {
  const Intstagram({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthBloc()),
        ChangeNotifierProvider(create: (context) => UserProvider(),),
        
      ],
      child: MaterialApp(
        routes: {
          Login.id : (context) => const Login(),
          HomeScreen.id : (context) => const HomeScreen(),
        },
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: Colors.black),
        home: const ConnectionStateStreamBuilder(),
      ),
    );
  }
}




