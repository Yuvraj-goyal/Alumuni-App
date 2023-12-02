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
    apiKey: 'AIzaSyAMpQVFE0i0s1ZHWRsbdDHcGqvF_zgAqRE',
    appId: '1:663719435573:web:535fb2a1fe3f94fe0a407c',
    messagingSenderId: '663719435573',
    projectId: 'reunion-85acb',
    authDomain: 'reunion-85acb.firebaseapp.com',
    storageBucket: 'reunion-85acb.appspot.com',
    measurementId: 'G-VXJG6QD22B',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCUiROnLa_JfPihW6etcdWhqUSXAdE0PBU',
    appId: '1:663719435573:android:66319238d5c606270a407c',
    messagingSenderId: '663719435573',
    projectId: 'reunion-85acb',
    storageBucket: 'reunion-85acb.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCYHWa5zekcWcfg515W_d8HOFlZKsZURvQ',
    appId: '1:663719435573:ios:b322b94d8d5bc4c70a407c',
    messagingSenderId: '663719435573',
    projectId: 'reunion-85acb',
    storageBucket: 'reunion-85acb.appspot.com',
    iosBundleId: 'com.example.gtkFlutter',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCYHWa5zekcWcfg515W_d8HOFlZKsZURvQ',
    appId: '1:663719435573:ios:69a9a956e2ccd5cd0a407c',
    messagingSenderId: '663719435573',
    projectId: 'reunion-85acb',
    storageBucket: 'reunion-85acb.appspot.com',
    iosBundleId: 'com.example.gtkFlutter.RunnerTests',
  );
}
