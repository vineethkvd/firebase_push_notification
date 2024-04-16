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
    apiKey: 'AIzaSyDRePJlZvS3PiG1W9bnHKcOes3aqVmBGt8',
    appId: '1:204818699899:web:461d6df666b6ff7b31b4de',
    messagingSenderId: '204818699899',
    projectId: 'fir-push-nofication',
    authDomain: 'fir-push-nofication.firebaseapp.com',
    storageBucket: 'fir-push-nofication.appspot.com',
    measurementId: 'G-6D2R9Q56N1',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAJVl3MwGxf-yZoty3y83267kkChAWtd0Y',
    appId: '1:204818699899:android:63caf21cf1f0d65631b4de',
    messagingSenderId: '204818699899',
    projectId: 'fir-push-nofication',
    storageBucket: 'fir-push-nofication.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDYX9-eMXVfX1h0JFM1TOARSPig5rVVeds',
    appId: '1:204818699899:ios:d6e7de3fc437fc4931b4de',
    messagingSenderId: '204818699899',
    projectId: 'fir-push-nofication',
    storageBucket: 'fir-push-nofication.appspot.com',
    iosBundleId: 'com.example.firebasePushNotification',
  );
}
