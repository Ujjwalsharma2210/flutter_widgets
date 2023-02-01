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
    apiKey: 'AIzaSyABuGp9oydTTD96a4qMJ-YanLC_Ku88Z-E',
    appId: '1:884413175629:web:57091aa55ea6a4c61b0904',
    messagingSenderId: '884413175629',
    projectId: 'betterlabs-e7beb',
    authDomain: 'betterlabs-e7beb.firebaseapp.com',
    storageBucket: 'betterlabs-e7beb.appspot.com',
    measurementId: 'G-EFL5NL1HZ5',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCMSKWe2DjUvBajv2-wtENNVx2v8Ivc8_c',
    appId: '1:884413175629:android:73977137ca52e2301b0904',
    messagingSenderId: '884413175629',
    projectId: 'betterlabs-e7beb',
    storageBucket: 'betterlabs-e7beb.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDZScZydFcxfJJAwdl9qKRDw2akOK5fv5M',
    appId: '1:884413175629:ios:daa6bb2e832888621b0904',
    messagingSenderId: '884413175629',
    projectId: 'betterlabs-e7beb',
    storageBucket: 'betterlabs-e7beb.appspot.com',
    iosClientId: '884413175629-avp6j3i4b72bk05bab90lbojf0l1qdb4.apps.googleusercontent.com',
    iosBundleId: 'com.example.widgets',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDZScZydFcxfJJAwdl9qKRDw2akOK5fv5M',
    appId: '1:884413175629:ios:daa6bb2e832888621b0904',
    messagingSenderId: '884413175629',
    projectId: 'betterlabs-e7beb',
    storageBucket: 'betterlabs-e7beb.appspot.com',
    iosClientId: '884413175629-avp6j3i4b72bk05bab90lbojf0l1qdb4.apps.googleusercontent.com',
    iosBundleId: 'com.example.widgets',
  );
}
