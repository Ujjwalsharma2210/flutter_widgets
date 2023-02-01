import 'package:flutter/material.dart';
import 'package:widgets/reuse_widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // const SignupPage({Key? key}) : super(key: key);
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Color darkGrey = Colors.grey.shade900;
  Color textColor = Colors.grey.shade500;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  // TextEditingController ConfirmPasswordController = TextEditingController();
  Future signup() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim());
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              height: height * 0.1,
            ),
            TitleText(context, 'Login'),
            SizedBox(
              height: height * 0.2,
            ),
            TextInputField(context, emailController, 'Enter email'),
            SizedBox(
              height: 10,
            ),
            TextInputField(context, passwordController, 'Enter password'),
            SizedBox(
              height: 10,
            ),
            // BasicButton(buttonHandler: signup, buttonTitle: 'Signup'),
            ElevatedButton(
              onPressed: signup,
              child: const Text(
                'Login',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Not a member?',
                  style: TextStyle(
                    color: textColor,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/SignupPage');
                  },
                  child: Text('Signup Now'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
