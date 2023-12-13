import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyCHyBG7vv_YRz9G9ULAc9ENxLB-QGyN_Ro",
            authDomain: "uc-tutoria-troya-g8gbiu.firebaseapp.com",
            projectId: "uc-tutoria-troya-g8gbiu",
            storageBucket: "uc-tutoria-troya-g8gbiu.appspot.com",
            messagingSenderId: "75771796469",
            appId: "1:75771796469:web:2b0ab3891cad7fafa65ebc"));
  } else {
    await Firebase.initializeApp();
  }
}
