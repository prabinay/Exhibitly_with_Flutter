import 'package:exhibitly_with_flutter/presentation/resources/color_manager.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../resources/routes_manager.dart';
import '../services/auth_service.dart';

class HomeFeedPage extends StatefulWidget {
  const HomeFeedPage({Key? key}): super(key: key);

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
        onPressed: () async {
          await AuthService().signOut();
          Navigator.pushNamed(context, Routes.logIn);
        },
        backgroundColor: ColorManager.KPrimaryColor,
        child: const Icon(Icons.logout_rounded),
      ),

      body: Center(
        child: Text("LOGGED IN AS: ${user.email!}"),
      ),
    );
  }
}
