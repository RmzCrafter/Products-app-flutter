// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBlY8brL4E9Jg4SjTKy_lPpAh5S1xyIKUE',
    appId: '1:933331242273:android:5a7e6f8eb3e66d72bec260',
    messagingSenderId: '933331242273',
    projectId: 'mini-8d126',
    storageBucket: 'mini-8d126.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC0UelQRN73gjamAI7vx-QduqOt-I-cUMk',
    appId: '1:933331242273:ios:8a14fa2ad4315c67bec260',
    messagingSenderId: '933331242273',
    projectId: 'mini-8d126',
    storageBucket: 'mini-8d126.firebasestorage.app',
    iosBundleId: 'com.example.amazonmini',
  );

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBVUxO97PDRkMfZZcxu90zwLmMKRjab3wA',
    appId: '1:933331242273:web:e5e10296f72baaa2bec260',
    messagingSenderId: '933331242273',
    projectId: 'mini-8d126',
    authDomain: 'mini-8d126.firebaseapp.com',
    storageBucket: 'mini-8d126.firebasestorage.app',
    measurementId: 'G-FPPRCCJ0LM',
  );

}