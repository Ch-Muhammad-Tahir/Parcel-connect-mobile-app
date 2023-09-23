import 'package:flutter/material.dart';
import 'package:fyp_parcel_connect/providers/authentication_provider.dart';
import 'package:fyp_parcel_connect/utils/helper_functions.dart';
import 'package:fyp_parcel_connect/views/get_user_detail_screen/get_user_detail_screen.dart';
import 'package:fyp_parcel_connect/widgets/my_custom_text.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';

class OtpAuthenticationScreenWidget extends StatefulWidget {
  const OtpAuthenticationScreenWidget({Key? key}) : super(key: key);

  @override
  State<OtpAuthenticationScreenWidget> createState() =>
      _OtpAuthenticationScreenWidgetState();
}

class _OtpAuthenticationScreenWidgetState
    extends State<OtpAuthenticationScreenWidget> {
  final pinController = TextEditingController();
  final focusNode = FocusNode();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    pinController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const focusedBorderColor = Color.fromRGBO(23, 171, 144, 1);
    const fillColor = Color.fromRGBO(243, 246, 249, 0);
    const borderColor = Color.fromRGBO(23, 171, 144, 0.4);
    String getOtp = "";
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
        fontSize: 22,
        color: Color.fromRGBO(30, 60, 87, 1),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(19),
        border: Border.all(color: borderColor),
      ),
    );

    /// Optionally you can use form to validate the Pinput
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("OTP"),
        centerTitle: true,
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // SizedBox(
              //   height: AppBar().preferredSize.height,
              // ),
              Image.asset(
                "assets/images/otp.png",
                height: 150,
              ),
              SizedBox(
                height: 10,
              ),
              const MyCustomText(
                text: "Verification OTP",
                textAlign: TextAlign.center,
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
              SizedBox(
                height: 10,
              ),
              const MyCustomText(
                text:
                    "We have sent the code verification to Your Mobile Phone Number",
                textAlign: TextAlign.center,
                fontSize: 17,
              ),
              SizedBox(
                height: AppBar().preferredSize.height,
              ),
              Directionality(
                // Specify direction if desired
                textDirection: TextDirection.ltr,
                child: Pinput(
                  length: 6,
                  controller: pinController,
                  focusNode: focusNode,
                  androidSmsAutofillMethod:
                      AndroidSmsAutofillMethod.smsUserConsentApi,
                  listenForMultipleSmsOnAndroid: true,
                  defaultPinTheme: defaultPinTheme,

                  separatorBuilder: (index) => const SizedBox(width: 8),
                  validator: (value) {},
                  // onClipboardFound: (value) {
                  //   debugPrint('onClipboardFound: $value');
                  //   pinController.setText(value);
                  // },
                  hapticFeedbackType: HapticFeedbackType.lightImpact,
                  onCompleted: (pin) {
                    debugPrint('onCompleted: $pin');
                    getOtp = pin;
                  },
                  onChanged: (value) {
                    debugPrint('onChanged: $value');
                  },
                  cursor: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 9),
                        width: 22,
                        height: 1,
                        color: focusedBorderColor,
                      ),
                    ],
                  ),
                  focusedPinTheme: defaultPinTheme.copyWith(
                    decoration: defaultPinTheme.decoration!.copyWith(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: focusedBorderColor),
                    ),
                  ),
                  submittedPinTheme: defaultPinTheme.copyWith(
                    decoration: defaultPinTheme.decoration!.copyWith(
                      color: fillColor,
                      borderRadius: BorderRadius.circular(19),
                      border: Border.all(color: focusedBorderColor),
                    ),
                  ),
                  errorPinTheme: defaultPinTheme.copyBorderWith(
                    border: Border.all(color: Colors.redAccent),
                  ),
                ),
              ),
              const Expanded(child: SizedBox()),
              ElevatedButton(
                  onPressed: () {
                    focusNode.unfocus();
                    Provider.of<AuthenticationProvider>(context, listen: false)
                        .btnOnTabVerifyOtp(getOtp, context)
                        .then((isValidOtp) {
                      if (isValidOtp) {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    GetUserDetailScreen()));
                      } else {
                        AppHelperFunction.showToast("Invalid OPT", context);
                      }
                    });
                  },
                  child: const Text(
                    "Verify",
                    style: TextStyle(fontSize: 18),
                  )),
              SizedBox(
                height: 40,
              )
            ],
          ),
        ),
      ),
    );
  }
}
