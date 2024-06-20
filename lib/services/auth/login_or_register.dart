import 'package:flutter/material.dart';
import 'package:foodapp/pages/login_page.dart';
import 'package:foodapp/pages/register_page.dart';

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {
//initially login
  bool showLoginPage = true;

//toggle b/w register and login
  void togglePages() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginPage(ontap: togglePages);
    } else {
      return RegisterPage(ontap: togglePages);
    }
  }
}
