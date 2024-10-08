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
        return macos;
      case TargetPlatform.windows:
        return windows;
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
    apiKey: 'AIzaSyBM6qRlbQW6-g_ta4dFdD90HH2qXrWfHqc',
    appId: '1:907646376928:web:e72a21085bfb1fc7b2e985',
    messagingSenderId: '907646376928',
    projectId: 'instagram-d4238',
    authDomain: 'instagram-d4238.firebaseapp.com',
    storageBucket: 'instagram-d4238.appspot.com',
    measurementId: 'G-ZQZC8K5X3Q',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBewiEUahJ7N4EGtdaW1hzBc56GDzyUwcM',
    appId: '1:907646376928:android:ad7600ce73d92baab2e985',
    messagingSenderId: '907646376928',
    projectId: 'instagram-d4238',
    storageBucket: 'instagram-d4238.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAfjQOujZsKwLGLubWPTosz_7rT5_DFnkM',
    appId: '1:907646376928:ios:8e9aa5c2eb401959b2e985',
    messagingSenderId: '907646376928',
    projectId: 'instagram-d4238',
    storageBucket: 'instagram-d4238.appspot.com',
    iosBundleId: 'com.example.socialMediaApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAfjQOujZsKwLGLubWPTosz_7rT5_DFnkM',
    appId: '1:907646376928:ios:8e9aa5c2eb401959b2e985',
    messagingSenderId: '907646376928',
    projectId: 'instagram-d4238',
    storageBucket: 'instagram-d4238.appspot.com',
    iosBundleId: 'com.example.socialMediaApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBM6qRlbQW6-g_ta4dFdD90HH2qXrWfHqc',
    appId: '1:907646376928:web:396b4cafdadf9fadb2e985',
    messagingSenderId: '907646376928',
    projectId: 'instagram-d4238',
    authDomain: 'instagram-d4238.firebaseapp.com',
    storageBucket: 'instagram-d4238.appspot.com',
    measurementId: 'G-PLPKHFJQ9B',
  );
}
