import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:exhibitly_with_flutter/presentation/home/home_page.dart';
import 'package:exhibitly_with_flutter/presentation/login/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../models/users.dart';

class AuthController extends GetxController {
  late Rx<User?> _user;
  // late Rx<Business?> _business;
  User get user => _user.value!;
  // User get business => _user.value!;

  final Rx<Map<String, dynamic>> _userData = Rx<Map<String, dynamic>>({});
  // final Rx<Map<String, dynamic>> _businessData = Rx<Map<String, dynamic>>({});

  Map<String, dynamic> get userData => _userData.value;
  // Map<String, dynamic> get businessData => _businessData.value;

  static AuthController instance = Get.find();

  @override
  void onReady() {
  
    super.onReady();

    _user = Rx<User?>(FirebaseAuth.instance.currentUser());
    _user.bindStream(FirebaseAuth.instance.authStateChanges());
    ever(_user, _setInitialView);
  }

  _setInitialView(User? user) {
    // print(user);
    if (user == null) {
      Get.offAll(() => LoginPage());
    } else {
      if (user.displayName == "job-seeker") {
        Get.offAll(() => MainPage());
        // Get.offAll(() => LoginScreen());
        // FirebaseAuth.instance.signOut();
      } else {
        // Get.offAll(() => LandingScreen());
      }
    }
  }

  void signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  getUserData() async {
    var userDoc = await FirebaseFirestore.instance
        .collection("users")
        .doc(user.uid)
        .get();
    final userData = userDoc.data() as dynamic;
    String uid = userDoc['uid'];
    String username = userDoc['username'];
    String jobCategory = userDoc['jobCategory'];
    String profilePhoto = userDoc['profilePhoto'];
    String country = userDoc['country'];
    String city = userDoc['city'];
    String jobDesc = userDoc['jobDesc'];
    String color = userDoc['color'];
    List skills = userDoc['skills'];

    int followers = 0;
    int following = 0;
    return _userData.value = {
      'uid': uid,
      'followers': followers.toString(),
      'following': following.toString(),
      'profilePhoto': profilePhoto,
      'username': username,
      'country': country,
      'jobCategory': jobCategory,
      'city': city,
      'jobDesc': jobDesc,
      'color': color,
      'skills': skills,
    };
  }

  // void businessSignUp(String jobCategory, String orgName, String phoneNo,
  //     String email, String password) async {
  //   try {
  //     if (email.isNotEmpty &&
  //         orgName.isNotEmpty &&
  //         password.isNotEmpty &&
  //         email.isNotEmpty &&
  //         phoneNo.isNotEmpty &&
  //         password.isNotEmpty &&
  //         jobCategory.isNotEmpty) {
  //       try {
  //         UserCredential cred = await FirebaseAuth.instance
  //             .createUserWithEmailAndPassword(email: email, password: password);
  //         cred.user!.updateDisplayName('employer');
  //         Business business = Business(
  //             email: email,
  //             orgName: orgName,
  //             password: password,
  //             phoneNo: phoneNo,
  //             jobCategory: jobCategory,
  //             jobDesc: '',
  //             profilePhoto:
  //                 'https://github.com/Sarthak-777/FInal_Project_flutter_Buness_Networking_System/blob/main/assets/person.jpg?raw=true',
  //             uid: cred.user!.uid,
  //             type: 'employer');

  //         await FirebaseFirestore.instance
  //             .collection('business')
  //             .doc(cred.user!.uid)
  //             .set(business.toMap());
  //         await FirebaseFirestore.instance
  //             .collection('email')
  //             .doc(email)
  //             .set({"email": email});
  //         Get.offAll(() => BusinessHomeScreen());
  //         // Get.to(VerifyScreen());
  //       } on FirebaseAuthException catch (e) {
  //         Get.snackbar("Error", e.code);
  //       }
  //     } else {
  //       Get.snackbar("Error", "Please enter all the required data");
  //     }
  //   } catch (e) {
  //     Get.snackbar("Error Creating Account", "Check your credentials");
  //     log(e.toString());
  //   }
  // }

  void signUp(String email, String username, String password, String country,
      String city, String phoneNo, String work, String jobCategory) async {
    try {
      if (email.isNotEmpty &&
          username.isNotEmpty &&
          password.isNotEmpty &&
          country.isNotEmpty &&
          city.isNotEmpty &&
          phoneNo.isNotEmpty &&
          work.isNotEmpty &&
          jobCategory.isNotEmpty) {
        try {
          UserCredential cred = await FirebaseAuth.instance
              .createUserWithEmailAndPassword(email: email, password: password);
          cred.user!.updateDisplayName('job-seeker');
          MyUser user = MyUser(
            email: email,
            username: username,
            password: password,
            country: country,
            city: city,
            phoneNo: phoneNo,
            
            profilePhoto:
                'https://github.com/Sarthak-777/FInal_Project_flutter_Buness_Networking_System/blob/main/assets/person.jpg?raw=true',
            id: cred.user!.uid,
            skills: [],
            type: 'job-seeker',
            color: 'red',
          );

          await FirebaseFirestore.instance
              .collection('users')
              .doc(cred.user!.uid)
              .set(user.toMap());
          await FirebaseFirestore.instance
              .collection('email')
              .doc(email)
              .set({"email": email});

          // Get.to(VerifyScreen());
        } on FirebaseAuthException catch (e) {
          Get.snackbar("Error", e.code);
        }
      } else {
        Get.snackbar("Error", "Please enter all the required data");
      }
    } catch (e) {
      Get.snackbar("Error Creating Account", "Check your credentials");
      log(e.toString());
    }
  }

   void loginWithEmalAndPassword(String email, String password) async {
    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password);
        Get.offAll(() => MainPage());
      } else {
        Get.snackbar("Error", "Fill both the forms below");
      }
    } catch (e) {
      Get.snackbar("Error logging in ", "Email or password incorrect");
    }
  }

  void googleSignIn() async {
    CollectionReference ref = FirebaseFirestore.instance.collection("email");
    try {
      QuerySnapshot snapshot = await ref.get();
      final allData = snapshot.docs.map((doc) => doc.data()).toList();
      GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
      AuthCredential cred = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);
      UserCredential userCred =
          await FirebaseAuth.instance.signInWithCredential(cred);
      await FirebaseFirestore.instance
          .collection('email')
          .doc(userCred.user!.email)
          .set({"email": userCred.user!.email});
      try {
        print(allData);
        for (var data in allData) {
          if (userCred.user!.email == (data as Map)['email']) {
            print('home');
            Get.off(() => MainPage());
            break;
          } else {
            print('google');
            // Get.to(() => GoogleLogin(), arguments: [userCred]);
          }
        }
      } catch (e) {
        log(e.toString());
      }
    } catch (e) {
      Get.snackbar("Failed", "Sign in Failed");
    }
  }

   void sendPasswordResetEmail(String email) {
    FirebaseAuth.instance.sendPasswordResetEmail(email: email);
  }




}
