import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rentify/Screens/HomeScreen.dart';
import 'package:rentify/Screens/LoginScreen.dart';
import 'package:rentify/services/authProvider.dart';
import 'package:google_fonts/google_fonts.dart';

class Landingpage extends StatefulWidget {
  @override
  _LandingpageState createState() => _LandingpageState();
}

class _LandingpageState extends State<Landingpage> {
  @override
  Widget build(BuildContext context) {
    final auth = AuthProvider.of(context);
    return StreamBuilder<User>(
        stream: auth.authStateChanges(),
        builder: (context, snapshot) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
                textTheme: GoogleFonts.ubuntuTextTheme(
              Theme.of(context).textTheme,
            )),
            title: "Rentify",
            home: snapshot.hasData ? HomeScreen() : LoginScreen(),
          );
        });
  }
}
