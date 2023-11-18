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
    apiKey: 'AIzaSyBfJmMXCUTIaGWGfUvh6-OkqPreWS7hBJQ',
    appId: '1:1092325822218:web:26359c9dcf1372c3fe34f3',
    messagingSenderId: '1092325822218',
    projectId: 'fir-dad-quiz',
    authDomain: 'fir-dad-quiz.firebaseapp.com',
    storageBucket: 'fir-dad-quiz.appspot.com',
    measurementId: 'G-RH90N52GG4',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDSUEyq2fY7fCwdtiIAQaH7ipMkK3fJrpg',
    appId: '1:1092325822218:android:3d11a06b84ebac61fe34f3',
    messagingSenderId: '1092325822218',
    projectId: 'fir-dad-quiz',
    storageBucket: 'fir-dad-quiz.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBr0v7sAv1SucB5jY50_VUSr_USA1KiFyo',
    appId: '1:1092325822218:ios:529e529d7e776287fe34f3',
    messagingSenderId: '1092325822218',
    projectId: 'fir-dad-quiz',
    storageBucket: 'fir-dad-quiz.appspot.com',
    iosBundleId: 'com.example.dadQuizApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBr0v7sAv1SucB5jY50_VUSr_USA1KiFyo',
    appId: '1:1092325822218:ios:074a3ee745142eb1fe34f3',
    messagingSenderId: '1092325822218',
    projectId: 'fir-dad-quiz',
    storageBucket: 'fir-dad-quiz.appspot.com',
    iosBundleId: 'com.example.dadQuizApp.RunnerTests',
  );
}
