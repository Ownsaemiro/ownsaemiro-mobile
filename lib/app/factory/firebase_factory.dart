import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

class FirebaseFactory {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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
    apiKey: 'AIzaSyC6FlQ5clwyTTPnBdd2NidxeA3yxwQO_Sc',
    appId: '1:294778579501:android:f68f991779e60d16fb26a4',
    messagingSenderId: '294778579501',
    projectId: 'ownsaemiro-75f1f',
    storageBucket: 'ownsaemiro-75f1f.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBKEyHgpZXiaMiTxFnZzqb4ceRle4PQKgA',
    appId: '1:294778579501:ios:71128d1b41f6a41cfb26a4',
    messagingSenderId: '294778579501',
    projectId: 'ownsaemiro-75f1f',
    storageBucket: 'ownsaemiro-75f1f.appspot.com',
    iosBundleId: 'org.dongguk.ownsaemiro.ownsaemiro',
  );
}
