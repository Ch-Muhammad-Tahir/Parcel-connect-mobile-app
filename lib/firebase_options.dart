// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBw5JXsEayEOvSiemmgjnfCL2r5gq4yo_o',
    appId: '1:561242041363:web:e707cb4b3b7272970ba3e6',
    messagingSenderId: '561242041363',
    projectId: 'fyp-parcel-connect',
    authDomain: 'fyp-parcel-connect.firebaseapp.com',
    storageBucket: 'fyp-parcel-connect.appspot.com',
    measurementId: 'G-FMSHFDQN5T',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC15OMl0G29whRqg-3ggXTDIsbZGqpCUUU',
    appId: '1:561242041363:android:59b2cbcda92890db0ba3e6',
    messagingSenderId: '561242041363',
    projectId: 'fyp-parcel-connect',
    storageBucket: 'fyp-parcel-connect.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBtLY-N-Xa_1z67JKoMfcAphfNAHGGREts',
    appId: '1:561242041363:ios:99818b9a414111740ba3e6',
    messagingSenderId: '561242041363',
    projectId: 'fyp-parcel-connect',
    storageBucket: 'fyp-parcel-connect.appspot.com',
    iosClientId: '561242041363-f5uol25ok1juv8mht9umnijvq7t7oud9.apps.googleusercontent.com',
    iosBundleId: 'com.example.fypParcelConnect',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBtLY-N-Xa_1z67JKoMfcAphfNAHGGREts',
    appId: '1:561242041363:ios:a0d0042ce17501d20ba3e6',
    messagingSenderId: '561242041363',
    projectId: 'fyp-parcel-connect',
    storageBucket: 'fyp-parcel-connect.appspot.com',
    iosClientId: '561242041363-docfbkb8valc9s083v26f8d0impjhh1b.apps.googleusercontent.com',
    iosBundleId: 'com.example.fypParcelConnect.RunnerTests',
  );
}
