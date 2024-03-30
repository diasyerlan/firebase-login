// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpPage extends StatefulWidget {
  VoidCallback showLoginPage;
  SignUpPage({
    super.key,
    required this.showLoginPage,
  });

  @override
  State<SignUpPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<SignUpPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _ageController = TextEditingController();

  Future signUp() async {
    if (passwordConfirmed()) {
      FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim());

      addDetails(
          _firstNameController.text.trim(),
          _lastNameController.text.trim(),
          int.parse(_ageController.text.trim()),
          _emailController.text.trim());
    }
  }

  Future addDetails(
      String firstname, String lastname, int age, String email) async {
    await FirebaseFirestore.instance.collection('users').add({
      'first name': firstname,
      'last name': lastname,
      'age': age,
      'email': email
    });
  }

  bool passwordConfirmed() {
    return _passwordController.text.trim() ==
        _confirmPasswordController.text.trim();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _lastNameController.dispose();
    _firstNameController.dispose();
    _ageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[100],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                children: [
                  const SizedBox(height: 50),
                  Icon(
                    Icons.android,
                    size: 100,
                  ),
                  SizedBox(height: 60),
                  Text('Hello There!', style: GoogleFonts.abel(fontSize: 50)),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Register below with your user details!",
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                    ),
                    child: Column(
                      children: [
                        Container(
                          height: 60,
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black, width: 1),
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15)),
                          child: TextField(
                            controller: _firstNameController,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(top: 10),
                              hintText: 'First name',
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          height: 60,
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black, width: 1),
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15)),
                          child: TextField(
                            controller: _lastNameController,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(top: 10),
                              hintText: 'Last name',
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          height: 60,
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black, width: 1),
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15)),
                          child: TextField(
                            controller: _ageController,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(top: 10),
                              hintText: 'Age',
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          height: 60,
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black, width: 1),
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15)),
                          child: TextField(
                            controller: _emailController,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(top: 10),
                              hintText: 'Email',
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          height: 60,
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black, width: 1),
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15)),
                          child: TextField(
                            obscureText: true,
                            controller: _passwordController,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(top: 10),
                              hintText: 'Password',
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          height: 60,
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black, width: 1),
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15)),
                          child: TextField(
                            obscureText: true,
                            controller: _confirmPasswordController,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(top: 10),
                              hintText: 'Confirm password',
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        GestureDetector(
                          onTap: signUp,
                          child: Container(
                              height: 70,
                              width: 400,
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              decoration: BoxDecoration(
                                  color: Colors.grey[900],
                                  borderRadius: BorderRadius.circular(15)),
                              child: Center(
                                  child: Text(
                                'Sign Up',
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ))),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already a member? ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      GestureDetector(
                        onTap: widget.showLoginPage,
                        child: Text(
                          'Log In',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.blue[800]),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
