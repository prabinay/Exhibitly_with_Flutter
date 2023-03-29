import 'package:exhibitly_with_flutter/presentation/resources/color_manager.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../resources/routes_manager.dart';

class HomeFeedPage extends StatefulWidget {
  HomeFeedPage({super.key});

  @override
  State<HomeFeedPage> createState() => _HomeFeedPageState();
}

class _HomeFeedPageState extends State<HomeFeedPage> {
  final user = FirebaseAuth.instance.currentUser!;

//  signout user
  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  floating Action Button using for signout ,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          signUserOut();
          Navigator.pushNamed(context, Routes.logIn);
        },
        child: Icon(Icons.logout_rounded),
        backgroundColor: ColorManager.KPrimaryColor,
      ),

      body: Center(
        child: Text("LOGGED IN AS: " + user.email!),
      ),
    );
  }
}
