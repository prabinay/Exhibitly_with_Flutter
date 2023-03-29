import 'package:exhibitly_with_flutter/presentation/home/home_page.dart';
import 'package:exhibitly_with_flutter/presentation/login/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import'package:flutter/material.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          // user logged in
          if (snapshot.hasData){
            return MainPage();
          }
          else{
            return LoginPage();
          }
        }),
    );
  }
}