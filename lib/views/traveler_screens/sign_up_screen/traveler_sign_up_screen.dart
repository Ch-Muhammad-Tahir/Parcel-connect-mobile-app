import 'package:flutter/material.dart';
import '../../../utils/helper_functions.dart';
import '../../../views/traveler_screens/sign_up_screen/verification_documents.dart';

class TravelerSignUpScreen extends StatelessWidget {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController cnicController = TextEditingController();

  TravelerSignUpScreen({super.key});

  void navigateToNextScreen(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => const TravelerVerificationScreen()));
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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: fullNameController,
                decoration: const InputDecoration(labelText: 'Full Name'),
              ),
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
              TextField(
                controller: addressController,
                decoration: const InputDecoration(labelText: 'Address'),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: phoneNumberController,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(labelText: 'Phone Number'),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: cnicController,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(labelText: 'CNIC'),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  if (fullNameController.text.isEmpty ||
                      emailController.text.isEmpty ||
                      passwordController.text.isEmpty ||
                      addressController.text.isEmpty ||
                      phoneNumberController.text.isEmpty ||
                      cnicController.text.isEmpty) {
                    AppHelperFunction.showToast(
                        "Please Fill All Fields", context);
                  } else {
                    navigateToNextScreen(context);
                  }
                },
                child: const Text('Next'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
