import 'dart:developer';

import 'package:exhibitly_with_flutter/presentation/login/button.dart';
import 'package:exhibitly_with_flutter/presentation/resources/color_manager.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:simple_animations/simple_animations.dart';

import '../resources/routes_manager.dart';
import '../resources/strings_manager.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailTextController = TextEditingController();

  final _passwordTextController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool _isObscure = true;
  bool _isLoading = false;

  // signin method
  void signUserIn() {}

  void googleSignIn() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.KSecondaryColor,
      body: SingleChildScrollView(
        child: SafeArea(
          // ignore: prefer_const_literals_to_create_immutables
          child: Form(
            key: formKey,
            child: Container(
              padding: EdgeInsets.only(left: 15, right: 15),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    const SizedBox(height: 50),

                    // logo
                    const Icon(
                      Icons.account_circle,
                      size: 100,
                    ),

                    const SizedBox(height: 50),

                    // welcome back, you've been missed!
                    Text(
                      'Welcome back you\'ve been missed!',
                      style: TextStyle(
                        color: Colors.grey[700],
                        fontSize: 16,
                      ),
                    ),

                    const SizedBox(height: 25),

                    // Textfieldfor username
                    TextFormField(
                        controller: _emailTextController,
                        // obscureText: obscureText,

                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey.shade500),
                                borderRadius: BorderRadius.circular(10.0)),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide:
                                  BorderSide(color: ColorManager.kError),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide:
                                  BorderSide(color: ColorManager.kError),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide:
                                  BorderSide(color: ColorManager.kError),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide:
                                  BorderSide(color: ColorManager.kError),
                            ),
                            fillColor: Colors.grey.shade200,
                            filled: true,
                            labelText: 'Email',
                            labelStyle: TextStyle(color: Colors.grey[500]),
                            prefixIcon: Icon(
                              Icons.email,
                              color: ColorManager.KPrimaryColor,
                            )),
                        validator: MultiValidator([
                          RequiredValidator(errorText: "* Required"),
                          EmailValidator(errorText: "Enter valid email id"),
                        ])),

                    const SizedBox(height: 16),

                    TextFormField(
                      controller: _passwordTextController,
                      obscureText: _isObscure,
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey.shade500),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(color: ColorManager.kError),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(color: ColorManager.kError),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(color: ColorManager.kError),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(color: ColorManager.kError),
                          ),
                          fillColor: Colors.grey.shade200,
                          filled: true,
                          labelText: 'Password',
                          labelStyle: TextStyle(color: Colors.grey[500]),
                          prefixIcon: Icon(
                            Icons.lock,
                            color: ColorManager.KPrimaryColor,
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _isObscure
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: ColorManager.KPrimaryColor,
                            ),
                            onPressed: () {
                              setState(() {
                                _isObscure = !_isObscure;
                              });
                            },
                          )),
                      validator: MultiValidator([
                        RequiredValidator(errorText: "* Required"),
                        MinLengthValidator(6,
                            errorText: "Password min 6 char required"),
                        MaxLengthValidator(15,
                            errorText:
                                "Password should less less than 15 char"),
                      ]),
                    ),

                    const SizedBox(height: 10),

                    // forgot password?
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: () {},
                            child: Text(
                              'Forgot Password?',
                              style: TextStyle(color: Colors.grey[600]),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 25),

                    Container(
                      margin: const EdgeInsets.only(top: 20),
                      padding: EdgeInsets.only(left: 15, right: 15),
                      height: 50,
                      width: 250,
                      decoration: BoxDecoration(
                          color: ColorManager.KPrimaryColor,
                          borderRadius: BorderRadius.circular(20)),
                      child: GestureDetector(
                        child: TextButton(
                          onPressed: () {
                            FirebaseAuth.instance
                                .signInWithEmailAndPassword(
                                    email: _emailTextController.text,
                                    password: _passwordTextController.text)
                                .then((value) {
                              print("Logged In");
                              Navigator.pushNamed(context, Routes.mainPage);
                            }).onError((error, stackTrace) {
                              print("Error ${error.toString()}");
                            });

                            if (formKey.currentState!.validate()) {
                              log('fdjgf');
                              //here call your function
                              print("not valid calling");
                              setState(() {
                                _isLoading = !_isLoading;
                              });
                            } else {
                              print("not valid");
                            }
                          },
                          child: const Text(
                            AppStrings.logIn,
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 50),

                    // or continue with
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Divider(
                              thickness: 0.5,
                              color: Colors.grey[400],
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Text(
                              'Or continue with',
                              style: TextStyle(color: Colors.grey[700]),
                            ),
                          ),
                          Expanded(
                            child: Divider(
                              thickness: 0.5,
                              color: Colors.grey[400],
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 50),

                    // google + apple sign in buttons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // google button
                        GoogleButton(
                          onTap: googleSignIn,
                        ),

                        SizedBox(width: 25),

                        // apple button
                        // SquareTile(imagePath: 'assets/images/apple.png')
                      ],
                    ),

                    const SizedBox(height: 50),

                    // not a member? register now
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Not a member?',
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                        const SizedBox(width: 4),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, Routes.signUp);
                          },
                          child: const Text(
                            'Register now',
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
        ),
      ),
    );
  }
}
