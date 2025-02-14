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
    apiKey: 'AIzaSyCf3n-Ip8QwNdfLs4cnY_ozlUaHwojtOAc',
    appId: '1:348414427765:web:4aada745a2f9f8bf3aae3c',
    messagingSenderId: '348414427765',
    projectId: 'fir-app-aecfd',
    authDomain: 'fir-app-aecfd.firebaseapp.com',
    storageBucket: 'fir-app-aecfd.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC4rgsjDmA8c3vo7-QlGuC3gcmMIdK9bio',
    appId: '1:348414427765:android:c3dec611d378245c3aae3c',
    messagingSenderId: '348414427765',
    projectId: 'fir-app-aecfd',
    storageBucket: 'fir-app-aecfd.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBKBLsCItIHn4PdzDoGkm8S3tsHeuuc4Ao',
    appId: '1:348414427765:ios:aa33f45d44072e403aae3c',
    messagingSenderId: '348414427765',
    projectId: 'fir-app-aecfd',
    storageBucket: 'fir-app-aecfd.appspot.com',
    iosBundleId: 'com.example.firebaseApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBKBLsCItIHn4PdzDoGkm8S3tsHeuuc4Ao',
    appId: '1:348414427765:ios:4ff1727d8f8352c93aae3c',
    messagingSenderId: '348414427765',
    projectId: 'fir-app-aecfd',
    storageBucket: 'fir-app-aecfd.appspot.com',
    iosBundleId: 'com.example.firebaseApp.RunnerTests',
  );
}
