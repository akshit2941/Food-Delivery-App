import 'package:flutter/material.dart';
import 'package:foodapp/components/my_button.dart';
import 'package:foodapp/components/my_text_field.dart';
// import 'package:foodapp/pages/home_page.dart';
import 'package:foodapp/services/auth/auth_service.dart';

class LoginPage extends StatefulWidget {
  final void Function()? ontap;

  const LoginPage({super.key, required this.ontap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  //login
  void logIn() async {
    // authenticate
    final authService = AuthService();

    //try sign in
    try {
      await authService.signInWithEmailPassword(
        emailController.text,
        passwordController.text,
      );
    } catch (e) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(e.toString()),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //logo
            Icon(
              Icons.lock_open_rounded,
              size: 100,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),

            const SizedBox(height: 25),

            //message
            Text(
              'Food Delivery App',
              style: TextStyle(
                fontSize: 16,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),

            const SizedBox(height: 25),
            //email verified
            MyTextfield(
              controller: emailController,
              hintText: "Email",
              obscureText: false,
            ),
            //password text

            const SizedBox(height: 10),

            MyTextfield(
              controller: passwordController,
              hintText: "Password",
              obscureText: true,
            ),

            const SizedBox(height: 10),

            //sig in
            MyButton(
              onTap: logIn,
              text: 'Sign In',
            ),
            const SizedBox(height: 10),

            //register
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Not a member?',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),
                const SizedBox(width: 4),
                GestureDetector(
                  onTap: widget.ontap,
                  child: Text(
                    'Register Now',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
