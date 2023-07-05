import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:insta/screens/signup_screen.dart';
import 'package:insta/utils/colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyDBIrCzRfV_Es5Ev-VDuXeDIJ2klrolZRs",
          appId: "1:616819595111:web:01006a475d81189d5e01c2",
          messagingSenderId: "616819595111",
          projectId: "instaclone-86ac6",
          storageBucket: "instaclone-86ac6.appspot.com"),
    );
  } else {
    await Firebase.initializeApp();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData.dark()
            .copyWith(scaffoldBackgroundColor: mobileBackgroundColor),
        home: const SignUpScreen());
    // home: const LayOut(webView: WebScreen(), mobileView: MobileScreen()));
  }
}
