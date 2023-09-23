import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../../services/firebase_manager.dart';
import '../../../utils/helper_functions.dart';
import '../../../views/traveler_screens/sign_up_screen/verification_documents.dart';

class TravelerSignUpScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  TravelerSignUpScreen({super.key});

  void navigateToNextScreen(BuildContext context) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => TravelerVerificationScreen()));
    // Navigate to the next screen or perform next actions here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Sign Up'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 16),
            TextField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(labelText: 'Password'),
            ),
            const SizedBox(height: 16),
            const Expanded(child: SizedBox()),
            ElevatedButton(
              onPressed: () async {
                if (emailController.text.isEmpty ||
                    passwordController.text.isEmpty) {
                  AppHelperFunction.showToast(
                      "Please Fill All Fields", context);
                } else {
                  String email = emailController.text.toString();
                  String password = passwordController.text.toString();
                  if (email.isValidEmail()) {
                    if (password.isValidPassword()) {
                      loader(true);
                      try {
                        await FirebaseManager.signUpOnFirebase(email, password)
                            .then((value) {
                          loader(false);
                          Navigator.pop(context);
                          AppHelperFunction.showToast(
                              "User SuccessFully SignUp", context);
                        });
                      } on FirebaseAuthException catch (exception) {
                        print(
                            "Firebase Auth Exception ${exception.toString()}");
                      }
                    } else {
                      AppHelperFunction.showToast(
                          "Invalid Password format. password should contain minimum 8 Characters",
                          context);
                    }
                  } else {
                    AppHelperFunction.showToast("InValid Email", context);
                  }

                  //navigateToNextScreen(context);
                }
              },
              child: const Text('Next'),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  void loader(bool flag) {
    flag ? const CircularProgressIndicator() : null;
  }
}
