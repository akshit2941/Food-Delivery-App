import 'package:flutter/material.dart';
import 'package:foodapp/components/my_button.dart';
import 'package:foodapp/components/my_text_field.dart';
import 'package:foodapp/services/auth/auth_service.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? ontap;

  const RegisterPage({super.key, required this.ontap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  void register() async {
    final authservice = AuthService();

    //check if password match
    if (passwordController.text == confirmPasswordController.text) {
      //create user
      try {
        await authservice.signUpWithEmailPassword(
            emailController.text, passwordController.text);
      }
      //errors
      catch (e) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(e.toString()),
          ),
        );
      }
    } else {
      //pass dont match
      showDialog(
        context: context,
        builder: (context) => const AlertDialog(
          title: Text("Password Dont Match"),
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
              "Let's Create an account for you",
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

            MyTextfield(
              controller: confirmPasswordController,
              hintText: "Confirm Password",
              obscureText: true,
            ),

            const SizedBox(height: 10),

            //sig in
            MyButton(
              onTap: register,
              text: 'Sign Up',
            ),
            const SizedBox(height: 10),

            //register
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already have an account',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),
                const SizedBox(width: 4),
                GestureDetector(
                  onTap: widget.ontap,
                  child: Text(
                    'Log In Now',
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
