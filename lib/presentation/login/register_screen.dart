import 'package:exhibitly_with_flutter/presentation/login/squaretile.dart';
import 'package:exhibitly_with_flutter/presentation/login/textfield.dart';
import 'package:flutter/material.dart';

import '../resources/color_manager.dart';
import '../resources/routes_manager.dart';
import 'button.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

    void signUserIn(){}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.KSecondaryColor,
      body: SafeArea(
        // ignore: prefer_const_literals_to_create_immutables
        child: Center(
          child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 50),

                // logo
                const Icon(
                  Icons.person_add,
                  size: 100,
                ),

                const SizedBox(height: 50),

                // welcome back, you've been missed!
                Text(
                  'Creeate a new Account',
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 16,
                  ),
                ),

                const SizedBox(height: 25),

                // username textfield
                MyTextField(
                  controller: usernameController,
                  hintText: 'Full Name',
                  obscureText: false,
                ),

                const SizedBox(height: 10),

                 MyTextField(
                  controller: usernameController,
                  hintText: 'Email',
                  obscureText: false,
                ),

                const SizedBox(height: 10),

                 MyTextField(
                  controller: usernameController,
                  hintText: 'Phone Number',
                  obscureText: false,
                ),

                const SizedBox(height: 10),

                

                // password textfield
                MyTextField(
                  controller: passwordController,
                  hintText: 'Password',
                  obscureText: true,
                ),

                const SizedBox(height: 10),

                 MyTextField(
                  controller: usernameController,
                  hintText: 'Confirm Password',
                  obscureText: false,
                ),

                const SizedBox(height: 10),

                

                // sign in button
                MyButton(
                  onTap: signUserIn,
                ),

                const SizedBox(height: 50),
              

                const SizedBox(height: 50),

                // not a member? register now
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already a member?',
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    const SizedBox(width: 4),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, Routes.logIn);
                      },
                      child: const Text(
                        'Login now',
                        
                        style: TextStyle(
                          color: Colors.brown,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                )
              ]),
        ),
      ),
    );
  }
}
