import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:rentify/Screens/HomeScreen.dart';
import 'package:rentify/Screens/LoginScreen.dart';
import 'package:rentify/Screens/universityscreen.dart';
import 'package:rentify/services/authProvider.dart';
import 'package:intl/intl.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  DateTime dob;
  var uid;
  final _formkey = GlobalKey<FormState>();
  final namecontroller = TextEditingController();

  final emailcontroller = TextEditingController();

  final passwordcontoller = TextEditingController();

  final phonecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    bool verification = false;
    Future getCurrentuser() async {
      final User user = FirebaseAuth.instance.currentUser;
      uid = user.uid;
    }

    Future<void> adddata(
        String name, String email, String phonenumber, String dob) async {
      final firestoreInstance = FirebaseFirestore.instance;
      await getCurrentuser().then((value) {
        firestoreInstance.collection("users").doc(uid).set({
          "name": name,
          "email": email,
          "phone": phonenumber,
          "dob": dob,
          "userverification": verification,
        }).then((_) {
          print("success!");
        });
      });
    }

    void datepicker() {
      showDatePicker(
              confirmText: "Confirm",
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(1988),
              lastDate: DateTime.now())
          .then((value) {
        if (value == null) {
          return;
        }
        setState(() {
          dob = value;
        });
      });
    }

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
                height: 100,
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
                      width: 135,
                    ),
                    Text(
                      "SIGN UP",
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
                          "Name",
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
                          controller: namecontroller,
                          validator: (value) {
                            if (value == null ||
                                value.isEmpty ||
                                !(value.length >= 3)) {
                              return 'Name must be atleast 3 letters';
                            }
                            return null;
                          },
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            focusColor: Colors.white,
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                            ),
                            hintStyle: TextStyle(color: Colors.white70),
                            icon: Icon(
                              Icons.person_outline_outlined,
                              color: Colors.white70,
                            ),
                            //labelText: "Email",
                            labelStyle: TextStyle(color: Colors.white70),
                          ),
                        ),
                      ),
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
                          validator: (value) {
                            if (value == null ||
                                value.isEmpty ||
                                !(value.contains('@'))) {
                              return 'enter valid email address';
                            }
                            return null;
                          },
                          style: TextStyle(color: Colors.white),
                          controller: emailcontroller,
                          decoration: InputDecoration(
                            focusColor: Colors.white,
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
                          validator: (value) {
                            if (value == null ||
                                value.isEmpty ||
                                !(value.length >= 8)) {
                              return 'password must be atleast 8 letters';
                            }
                            return null;
                          },
                          obscureText: true,
                          controller: passwordcontoller,
                          style: TextStyle(color: Colors.white),
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
                      Container(
                        padding: EdgeInsets.all(8),
                        child: Text(
                          "Phone Number",
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
                          controller: phonecontroller,
                          validator: (value) {
                            if (value == null ||
                                value.isEmpty ||
                                !(value.length == 10)) {
                              return 'Enter Valid phone number';
                            }
                            return null;
                          },
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                            ),
                            icon: Icon(
                              Icons.phone,
                              color: Colors.white70,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(8),
                        child: Text(
                          "Date Of Birth",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        height: 62,
                        width: double.infinity,
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Colors.black,
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          children: [
                            FittedBox(
                              child: Icon(
                                Icons.calendar_today,
                                color: Colors.white70,
                              ),
                            ),
                            SizedBox(width: 3),
                            TextButton(
                                onPressed: () {
                                  datepicker();
                                },
                                child: Text(
                                  dob == null
                                      ? "Choose Your Date of Birth"
                                      : DateFormat.yMd().format(dob).toString(),
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                )),
                          ],
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
                                    'SIGN UP',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  onPressed: () {
                                    if (_formkey.currentState.validate()) {
                                      auth
                                          .createUserWithEmailAndPassword(
                                              emailcontroller.text,
                                              passwordcontoller.text)
                                          .then((value) {
                                        adddata(
                                            namecontroller.text,
                                            emailcontroller.text,
                                            phonecontroller.text,
                                            DateFormat.yMd()
                                                .format(dob)
                                                .toString());
                                      }).then((value) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                                content: Text(
                                                    'Signed Up Successfully!')));
                                        Navigator.pushAndRemoveUntil(
                                            context,
                                            MaterialPageRoute(
                                                builder:
                                                    (BuildContext context) =>
                                                        UniversityScreen()),
                                            (route) => false);
                                      });
                                    }
                                  })),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        child: Row(
                          children: [
                            SizedBox(
                              width: 58,
                            ),
                            Text(
                              "Already have an account ?",
                              style: TextStyle(color: Colors.white),
                            ),
                            TextButton(
                                onPressed: () {
                                  Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              LoginScreen()),
                                      (route) => true);
                                },
                                child: Text(
                                  'Login Here',
                                  style: TextStyle(
                                    color: HexColor("#FF8000"),
                                  ),
                                )),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 50,
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
