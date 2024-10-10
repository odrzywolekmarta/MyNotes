import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mynotes/firebase_options.dart';
import 'package:mynotes/views/login_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
       
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        useMaterial3: true,
      ),
      home: const RegisterView(),
    )
  );
}

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  late final TextEditingController _email;
  late final TextEditingController _password;

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
        backgroundColor: const Color.fromARGB(255, 207, 160, 98),
      ),
      body: FutureBuilder(
        future: Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform,
        ),
        builder:(context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              return Column(
          children: [
            TextField(
              controller: _email,
              enableSuggestions: false,
              autocorrect: false,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                hintText: 'Enter your email here'
              ),
            ),
            TextField(
              controller: _password,
              obscureText: true,
              enableSuggestions: false,
              autocorrect: false,
              decoration: const InputDecoration(
                hintText: 'Enter your password here'
              ),
            ),
            TextButton(onPressed: () async {
              final email = _email.text;
              final password = _password.text;
              try {
              final userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                email: email, 
                password: password);
                print(userCredential);
              } on FirebaseAuthException catch (error) {
                switch (error.code) {
                  case 'weak-password':
                  print('Weak password');
                  case 'email-already-in-use':
                  print('Email already exists');
                  default: 
                  print(error.code);
                  print('Something else happened');
                }
              }
            }, 
            child: const Text('Register')
            )
          ],
        );
        default: 
        return const Text('Loading...');
          }
        }, 
      ),
    );
  }
}

