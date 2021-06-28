import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:rentify/Screens/HomeScreen.dart';
import 'package:rentify/Screens/SignupScreen.dart';
import 'package:rentify/services/authProvider.dart';

class LoginScreen extends StatelessWidget {
  final _formkey = GlobalKey<FormState>();
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final auth = AuthProvider.of(context);
    return Scaffold(
      backgroundColor: HexColor("#191919"),
      body: Container(
        padding: EdgeInsets.all(22),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 150,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 90,
                  ),
                  Container(
                    height: 180.00,
                    width: 180.00,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: new DecorationImage(
                            image: AssetImage("assets/Logo 1.png"),
                            fit: BoxFit.cover)),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                child: Row(
                  children: [
                    SizedBox(
                      width: 148,
                    ),
                    Text(
                      "LOGIN",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                child: Form(
                  key: _formkey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.all(8),
                        child: Text(
                          "Email",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                      ),
                      /*SizedBox(
                        height: 50,
                      ),*/
                      Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Colors.black,
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: TextFormField(
                          style: TextStyle(color: Colors.white),
                          controller: emailcontroller,
                          decoration: InputDecoration(
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                            ),
                            hintStyle: TextStyle(color: Colors.white70),
                            icon: Icon(
                              Icons.email_outlined,
                              color: Colors.white70,
                            ),
                            //labelText: "Email",
                            labelStyle: TextStyle(color: Colors.white70),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        padding: EdgeInsets.all(8),
                        child: Text(
                          "Password",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Colors.black,
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: TextFormField(
                          style: TextStyle(color: Colors.white),
                          controller: passwordcontroller,
                          obscureText: true,
                          decoration: InputDecoration(
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                            ),
                            hintStyle: TextStyle(color: Colors.white70),
                            icon: Icon(
                              Icons.person,
                              color: Colors.white70,
                            ),
                            //labelText: "Email",
                            labelStyle: TextStyle(color: Colors.white70),
                          ),
                        ),
                      ),
                      SizedBox(height: 30),
                      Row(
                        children: [
                          SizedBox(
                            width: 108,
                          ),
                          Container(
                              decoration: BoxDecoration(
                                  color: HexColor("#FF8000"),
                                  borderRadius: BorderRadius.circular(10)),
                              height: 50,
                              width: 140,
                              child: TextButton(
                                child: Text(
                                  'LOGIN',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                                onPressed: () async {
                                  await auth
                                      .signInWithEmailAndPassword(
                                          emailcontroller.text,
                                          passwordcontroller.text)
                                      .then((value) {
                                    Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                HomeScreen()),
                                        (route) => false);
                                  });
                                },
                              )),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        child: Row(
                          children: [
                            SizedBox(
                              width: 70,
                            ),
                            Text(
                              "Dont have account ?",
                              style: TextStyle(color: Colors.white),
                            ),
                            TextButton(
                                onPressed: () {
                                  Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              SignupScreen()),
                                      (route) => false);
                                },
                                child: Text(
                                  'Sign up here',
                                  style: TextStyle(
                                    color: HexColor("#FF8000"),
                                  ),
                                )),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
