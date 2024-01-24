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
    apiKey: 'AIzaSyCI6mshloCAvc9r-kpyMq97vQJkOinLm7o',
    appId: '1:405688122406:web:937b984d450f8873fc3ae7',
    messagingSenderId: '405688122406',
    projectId: 'fir-auth-4deb6',
    authDomain: 'fir-auth-4deb6.firebaseapp.com',
    storageBucket: 'fir-auth-4deb6.appspot.com',
    measurementId: 'G-8M985RJL4H',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDoTr5aOhsKlIPcEpO_YDex5mIDo91zJ_A',
    appId: '1:405688122406:android:1fd45774f1f76757fc3ae7',
    messagingSenderId: '405688122406',
    projectId: 'fir-auth-4deb6',
    storageBucket: 'fir-auth-4deb6.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCS_nk_HnRVu0iSHOV8NExwmIQxw5xn0eI',
    appId: '1:405688122406:ios:0af0bd790a67128cfc3ae7',
    messagingSenderId: '405688122406',
    projectId: 'fir-auth-4deb6',
    storageBucket: 'fir-auth-4deb6.appspot.com',
    iosBundleId: 'com.firebaseauth.firebaseauth',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCS_nk_HnRVu0iSHOV8NExwmIQxw5xn0eI',
    appId: '1:405688122406:ios:77a8a710fc29ee04fc3ae7',
    messagingSenderId: '405688122406',
    projectId: 'fir-auth-4deb6',
    storageBucket: 'fir-auth-4deb6.appspot.com',
    iosBundleId: 'com.firebaseauth.firebaseauth.RunnerTests',
  );
}