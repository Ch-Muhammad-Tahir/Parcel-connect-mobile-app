import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import '../firebase_options.dart';
import '../providers/on_boarding_provider.dart';
import '../providers/send_parcel_provide.dart';
import '../views/splash_screen/splash_screen.dart';

import 'package:provider/provider.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<OnBoardingProvider>(
            create: (context) => OnBoardingProvider()),
        ChangeNotifierProvider<SendParcelProvider>(
            create: (context) => SendParcelProvider()),
      ],
      child: const MaterialApp(
        home: SplashScreen(),
      ),
    ),
  );
}




// void main(List<String> args) {
//   runApp(MultiProvider(
//     providers: [
//       ChangeNotifierProvider<OnBoardingProvider>(
//           create: (context) => OnBoardingProvider()),
//     ],
//     child: DevicePreview(
//       builder: (BuildContext context) => MaterialApp(
//         useInheritedMediaQuery: true,
//         locale: DevicePreview.locale(context),
//         builder: DevicePreview.appBuilder,
//         home: LoginScreenWidget(),
//       ),
//     ),
//   ));
// }


