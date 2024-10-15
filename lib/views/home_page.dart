import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mynotes/firebase_options.dart';
import 'package:mynotes/views/login_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform,
        ),
        builder:(context, snapshot) {
          switch (snapshot.connectionState) {
          case ConnectionState.done:
          // final user = FirebaseAuth.instance.currentUser;
          // if (user?.emailVerified ?? false) {
          // return Text('Done');
          // } else {
          //   return const VerifyEmailView();
          // }
          return const LoginView();
        default: 
        return const CircularProgressIndicator();
          }
        }, 
      );
  } 
}

