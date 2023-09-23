import 'dart:math';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fyp_parcel_connect/providers/traveler_auth_provider.dart';
import 'package:fyp_parcel_connect/utils/helper_functions.dart';
import 'package:provider/provider.dart';
import '../../../services/firebase_manager.dart';
import '../sign_up_screen/traveler_sign_up_screen.dart';

class TravelerLoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  TravelerLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "traveler Login",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 40),
            Image.asset(
              "assets/images/journey.png",
              color: Colors.blue.shade300,
              height: 120,
              width: 120,
            ),
            const SizedBox(height: 40),
            TextField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                  labelText: 'Email', hintText: "Enter Your Email"),
            ),
            const SizedBox(height: 40),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password',
                suffixIcon: Icon(Icons.visibility_off),
              ),
            ),
            const Expanded(child: SizedBox()),
            ElevatedButton(
              onPressed: () {
                String email = emailController.text.trim();
                String password = passwordController.text.trim();

                if (email.isEmpty || password.isEmpty) {
                  AppHelperFunction.showToast(
                      "Email Or Password is Empty", context);
                }
                print("ON Pressed Login");
                Provider.of<TravelerAuthProvider>(context, listen: false)
                    .travelerLogin(email, password, context);
              },
              child: const Text(
                'Login',
                style: TextStyle(fontSize: 18),
              ),
            ),
            const SizedBox(height: 40),
            Align(
              alignment: Alignment.center,
              child: RichText(
                text: TextSpan(
                    text: 'Don\'t have an account? ',
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                          text: 'Sign Up',
                          style: const TextStyle(
                              color: Colors.blueAccent, fontSize: 16),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          TravelerSignUpScreen()));
                              // navigate to desired screen
                            }),
                    ]),
              ),
            ),
            const SizedBox(height: 80),
          ],
        ),
      ),
    );
  }
}
