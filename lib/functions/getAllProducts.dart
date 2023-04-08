import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

getAllPosts(String color) async {
  print(color);
  QuerySnapshot result = await FirebaseFirestore.instance
      .collection('products')
      // .where('id', isEqualTo: FirebaseAuth.instance.currentUser!.id)
      .get();

  print(result.docs.map((data) => FirebaseFirestore.instance
          .collection('proucts')
          .doc((data.data() as dynamic)['id'])
          .update({
        'color': color,
      })));
}
