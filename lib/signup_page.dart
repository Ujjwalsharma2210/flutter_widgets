import 'package:flutter/material.dart';
import 'package:widgets/reuse_widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

// await Firebase.initializeApp(
// options: DefaultFirebaseOptions.currentPlatform,
// );

class SignupPage extends StatefulWidget {
  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  // const SignupPage({Key? key}) : super(key: key);
  TextEditingController usernameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  // TextEditingController ConfirmPasswordController = TextEditingController();
  Future signup() async {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
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
            TitleText(context, 'Signup'),
            SizedBox(
              height: height * 0.2,
            ),
            TextInputField(context, usernameController, 'Enter Username'),
            SizedBox(
              height: 10,
            ),
            TextInputField(context, emailController, 'Enter Email'),
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
                'Signup',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
