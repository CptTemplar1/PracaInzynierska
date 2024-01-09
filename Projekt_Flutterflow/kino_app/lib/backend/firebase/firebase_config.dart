import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyDp_GzDfUjsNojMobLOhWkm1gtoGOn-BVY",
            authDomain: "flutterkino.firebaseapp.com",
            projectId: "flutterkino",
            storageBucket: "flutterkino.appspot.com",
            messagingSenderId: "382244426803",
            appId: "1:382244426803:web:b6d86ac2dac9ddcf4fbf46",
            measurementId: "G-3YV0N85L80"));
  } else {
    await Firebase.initializeApp();
  }
}
