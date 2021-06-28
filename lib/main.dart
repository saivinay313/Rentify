import 'package:flutter/material.dart';
import 'package:rentify/Screens/LoginScreen.dart';
import 'package:rentify/Screens/SignupScreen.dart';
import 'package:rentify/Screens/landingscreen.dart';
import 'package:rentify/Screens/universityscreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:rentify/introductionScreen.dart';
import 'package:rentify/services/authProvider.dart';
import 'package:rentify/services/authservice.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rentify/test.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return AuthProvider(
        auth: Auth(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              textTheme: GoogleFonts.ubuntuTextTheme(
            Theme.of(context).textTheme,
          )),
          title: "Rentify",
          home: IntroScreen(),
        ));
  }
}
