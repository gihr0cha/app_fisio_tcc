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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyDdzjOFXsNVH31sKjaZLH8aWo1QCiEX1WI',
    appId: '1:521264665454:web:1620fde78d4896bc50a77f',
    messagingSenderId: '521264665454',
    projectId: 'fisioconecta-b9fcf',
    authDomain: 'fisioconecta-b9fcf.firebaseapp.com',
    databaseURL: 'https://fisioconecta-b9fcf-default-rtdb.firebaseio.com',
    storageBucket: 'fisioconecta-b9fcf.appspot.com',
    measurementId: 'G-MSGCH0KRVN',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBiof6N3_FuvB5jyvFdu7RP7Ki64L-dq_k',
    appId: '1:521264665454:android:bc8db5a7afaf86d550a77f',
    messagingSenderId: '521264665454',
    projectId: 'fisioconecta-b9fcf',
    databaseURL: 'https://fisioconecta-b9fcf-default-rtdb.firebaseio.com',
    storageBucket: 'fisioconecta-b9fcf.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAobYbNphwCNlH26QwUG22WC5owMliw4g4',
    appId: '1:521264665454:ios:067a7444f8e9901d50a77f',
    messagingSenderId: '521264665454',
    projectId: 'fisioconecta-b9fcf',
    databaseURL: 'https://fisioconecta-b9fcf-default-rtdb.firebaseio.com',
    storageBucket: 'fisioconecta-b9fcf.appspot.com',
    iosBundleId: 'com.example.appFisioTcc',
  );
}
