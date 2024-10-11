import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mynotes/firebase_options.dart';
import 'package:mynotes/views/login_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        backgroundColor: const Color.fromARGB(255, 207, 160, 98),
      ),
      body: FutureBuilder(
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
        return const Text('Loading...');
          }
        }, 
      ),
    );
  } 
}

class VerifyEmailView extends StatefulWidget {
  const VerifyEmailView({super.key});

  @override
  State<VerifyEmailView> createState() => _VerifyEmailViewState();
}

class _VerifyEmailViewState extends State<VerifyEmailView> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
        Text('Please verify your email'),
        TextButton(onPressed: () async {
          final user = FirebaseAuth.instance.currentUser;
          await user?.sendEmailVerification();
        }, child: Text('Send email verification')) 
      ]
      );
  }
}