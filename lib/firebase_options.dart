import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart' show defaultTargetPlatform, kIsWeb;
import 'package:flutter/material.dart';

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
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCGl9uHngFZE6sBAof7pZjdFTFqa4uhRAI',
    appId: '1:517870828399:web:2a0eeac2c929c1a5fb869a',
    messagingSenderId: '517870828399',
    projectId: 'book-vault-29cd7',
    authDomain: 'book-vault-29cd7.firebaseapp.com',
    storageBucket: 'book-vault-29cd7.appspot.com',
    measurementId: 'YOUR_WEB_MEASUREMENT_ID',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC5mf5ut5FepqmFSwMXMKgdLL27qflR9es',
    appId: '1:517870828399:android:81ea1e82cc061c3dfb869a',
    messagingSenderId: '517870828399',
    projectId: 'book-vault-29cd7',
    storageBucket: 'book-vault-29cd7.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'YOUR_IOS_API_KEY',
    appId: 'YOUR_IOS_APP_ID',
    messagingSenderId: 'YOUR_IOS_MESSAGING_SENDER_ID',
    projectId: 'YOUR_IOS_PROJECT_ID',
    storageBucket: 'YOUR_IOS_STORAGE_BUCKET',
    iosClientId: 'YOUR_IOS_CLIENT_ID',
    iosBundleId: 'YOUR_IOS_BUNDLE_ID',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'YOUR_MACOS_API_KEY',
    appId: 'YOUR_MACOS_APP_ID',
    messagingSenderId: 'YOUR_MACOS_MESSAGING_SENDER_ID',
    projectId: 'YOUR_MACOS_PROJECT_ID',
    storageBucket: 'YOUR_MACOS_STORAGE_BUCKET',
    iosClientId: 'YOUR_MACOS_CLIENT_ID',
    iosBundleId: 'YOUR_MACOS_BUNDLE_ID',
  );
}
