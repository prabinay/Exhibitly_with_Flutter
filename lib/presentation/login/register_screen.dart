import 'package:exhibitly_with_flutter/presentation/login/squaretile.dart';
import 'package:exhibitly_with_flutter/presentation/login/textfield.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

import '../resources/color_manager.dart';
import '../resources/routes_manager.dart';
import 'button.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final usernameController = TextEditingController();

  final passwordController = TextEditingController();

  bool _isObscure = true;

  bool _isLoading = false;

  GlobalKey<FormState> fromKey = GlobalKey<FormState>();

    void signUserIn(){}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.KSecondaryColor,
      body: SingleChildScrollView(
        child: SafeArea(
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
                  TextFormField(
                      // controller: _passwordController,
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
                          labelText: 'Full Name',
                          labelStyle: TextStyle(color: Colors.grey[500]),
                          prefixIcon: Icon(
                            Icons.person_outlined,
                            color: ColorManager.KPrimaryColor,
                          ),
                          ),
                      validator: MultiValidator([
                        RequiredValidator(errorText: "* Required"),
                        
                      ]),
                    ),
      
                  const SizedBox(height: 10),
      
                  TextFormField(
                      // controller: _passwordController,
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
                          labelText: 'Email',
                          labelStyle: TextStyle(color: Colors.grey[500]),
                          prefixIcon: Icon(
                            Icons.email_outlined,
                            color: ColorManager.KPrimaryColor,
                          ),
                          ),
                      validator: MultiValidator([
                        RequiredValidator(errorText: "* Required"),
                          EmailValidator(errorText: "Enter valid email id"),
                      ]),
                    ),
      
                  const SizedBox(height: 10),
      
                   TextFormField(
                      // controller: _passwordController,
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
                          labelText: 'Phone No',
                          labelStyle: TextStyle(color: Colors.grey[500]),
                          prefixIcon: Icon(
                            Icons.phone_android,
                            color: ColorManager.KPrimaryColor,
                          ),
                          ),
                      validator: MultiValidator([
                        RequiredValidator(errorText: "* Required"),
                        
                      ]),
                    ),
      
                  const SizedBox(height: 10),
      
                  
      
                  // password textfield
                  TextFormField(
                      // controller: _passwordController,
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
                            errorText: "Password should less less than 15 char")
                      ]),
                    ),
                  const SizedBox(height: 10),
      
                  TextFormField(
                      // controller: _passwordController,
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
                          labelText: 'Confirm Password',
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
                            errorText: "Password should less less than 15 char")
                      ]),
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
      ),
    );
  }
}
