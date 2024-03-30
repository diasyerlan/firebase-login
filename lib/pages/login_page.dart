// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:firebase_app/pages/forgot_password_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  VoidCallback showRegisterPage;
  LoginPage({
    Key? key,
    required this.showRegisterPage,
  }) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future signIn() async {
    showDialog(
        context: context,
        builder: (context) {
          return Center(
            child: CircularProgressIndicator(),
          );
        });

    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim());

    Navigator.of(context).pop();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
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
                  SizedBox(height: 50),
                  Icon(
                    Icons.android,
                    size: 100,
                  ),
                  SizedBox(height: 60),
                  Text('Hello Again!', style: GoogleFonts.abel(fontSize: 50)),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Welcome back, you've been missed!",
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
                        Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              GestureDetector(
                                  onTap: () {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                      return ForgotPasswprdPage();
                                    }));
                                  },
                                  child: Text('Forgot Password?'))
                            ]),
                        SizedBox(height: 10),
                        GestureDetector(
                          onTap: signIn,
                          child: Container(
                              height: 70,
                              width: 400,
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              decoration: BoxDecoration(
                                  color: Colors.grey[900],
                                  borderRadius: BorderRadius.circular(15)),
                              child: Center(
                                  child: Text(
                                'Sign In',
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
                        'Not a member? ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      GestureDetector(
                        onTap: widget.showRegisterPage,
                        child: Text(
                          'Register now',
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
