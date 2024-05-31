import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyDgshAv1KfvudwRCwdeD4AEL9FO7jnFgvs",
            authDomain: "psychology-26941.firebaseapp.com",
            projectId: "psychology-26941",
            storageBucket: "psychology-26941.appspot.com",
            messagingSenderId: "115443810665",
            appId: "1:115443810665:web:12e9d2f0c99898efb33df8",
            measurementId: "G-48PXZL3CN7"));
  } else {
    await Firebase.initializeApp();
  }
}
