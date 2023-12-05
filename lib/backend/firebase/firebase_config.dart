import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyB1K39OIvuzCsAJO369pcXZu8vmfC1eHT4",
            authDomain: "myattemp01.firebaseapp.com",
            projectId: "myattemp01",
            storageBucket: "myattemp01.appspot.com",
            messagingSenderId: "542232580492",
            appId: "1:542232580492:web:10968b077b4930121106a9",
            measurementId: "G-16GSEYX6D1"));
  } else {
    await Firebase.initializeApp();
  }
}
