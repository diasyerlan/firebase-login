import 'package:firebase_app/pages/login_page.dart';
import 'package:firebase_app/pages/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool showRegister = true;
  toggleScreens() {
    setState(() {
      showRegister = !showRegister;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showRegister)
      return LoginPage(showRegisterPage: toggleScreens);
    else
      return SignUpPage(showLoginPage: toggleScreens);
  }
}
