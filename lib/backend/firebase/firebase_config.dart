import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyDza79Hvrk0ePORTsi6oXsNX0thGQWbszU",
            authDomain: "journeypro-a5a08.firebaseapp.com",
            projectId: "journeypro-a5a08",
            storageBucket: "journeypro-a5a08.appspot.com",
            messagingSenderId: "569419467591",
            appId: "1:569419467591:web:23be2ea9121bcec23a5a62",
            measurementId: "G-3YTRN1JBYR"));
  } else {
    await Firebase.initializeApp();
  }
}
