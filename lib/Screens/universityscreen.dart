import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:rentify/Screens/HomeScreen.dart';

class UniversityScreen extends StatefulWidget {
  @override
  _UniversityScreenState createState() => _UniversityScreenState();
}

class _UniversityScreenState extends State<UniversityScreen> {
  var university;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("#191919"),
      body: Container(
        padding: EdgeInsets.all(30),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 80,
              ),
              Container(
                alignment: Alignment.topRight,
                child: Icon(
                  Icons.person,
                  color: HexColor("#FF8000"),
                  size: 45,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                height: 22,
                alignment: Alignment.topLeft,
                child: Text(
                  "Choose your university",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Container(
                //padding: EdgeInsets.all(10),
                height: 120,
                width: 650,

                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Material(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.black,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(12),
                    splashColor: Colors.white24,
                    splashFactory: InkRipple.splashFactory,
                    onTap: () {
                      setState(() {
                        university = "Vellore Institute of Technology";
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    HomeScreen()),
                            (route) => false);
                      });
                    },
                    child: Row(
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          height: 70,
                          width: 100,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: new DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage('assets/vit.png')),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 30,
                            ),
                            Container(
                              padding: EdgeInsets.all(10),
                              child: Text(
                                "Vellore Institute of Technology",
                                style: TextStyle(
                                    color: Colors.white54, fontSize: 15),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(10, 0, 10, 2),
                              child: Text(
                                "Vellore",
                                style: TextStyle(
                                    color: Colors.white54,
                                    fontSize: 15,
                                    fontStyle: FontStyle.italic),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Container(
                //padding: EdgeInsets.all(10),
                height: 120,
                width: 650,

                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Material(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.black,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(12),
                    splashColor: Colors.white24,
                    splashFactory: InkRipple.splashFactory,
                    onTap: () {
                      setState(() {
                        university = "Vellore Institute of Technology";
                      });
                    },
                    child: Row(
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          height: 70,
                          width: 100,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: new DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage('assets/iitg.png')),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 30,
                            ),
                            Container(
                              padding: EdgeInsets.all(10),
                              child: Text(
                                "Indian Institute of Technology",
                                style: TextStyle(
                                    color: Colors.white54, fontSize: 15),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(10, 0, 10, 2),
                              child: Text(
                                "Guwahati",
                                style: TextStyle(
                                    color: Colors.white54,
                                    fontSize: 15,
                                    fontStyle: FontStyle.italic),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Container(
                //padding: EdgeInsets.all(10),
                height: 120,
                width: 650,

                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Material(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.black,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(12),
                    splashColor: Colors.white24,
                    splashFactory: InkRipple.splashFactory,
                    onTap: () {
                      setState(() {
                        university = "SRM university";
                      });
                    },
                    child: Row(
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          height: 70,
                          width: 100,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: new DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage('assets/srmlogo.png')),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 30,
                            ),
                            Container(
                              padding: EdgeInsets.all(10),
                              child: Text(
                                "SRM university",
                                style: TextStyle(
                                    color: Colors.white54, fontSize: 15),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(10, 0, 10, 2),
                              child: Text(
                                "Chennai",
                                style: TextStyle(
                                    color: Colors.white54,
                                    fontSize: 15,
                                    fontStyle: FontStyle.italic),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Container(
                //padding: EdgeInsets.all(10),
                height: 120,
                width: 650,

                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Material(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.black,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(12),
                    splashColor: Colors.white24,
                    splashFactory: InkRipple.splashFactory,
                    onTap: () {
                      setState(() {
                        university = "NIT Warangal";
                      });
                    },
                    child: Row(
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          height: 70,
                          width: 100,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: new DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage('assets/nitwlogo.png')),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 30,
                            ),
                            Container(
                              padding: EdgeInsets.all(10),
                              child: Text(
                                "National Institute of Technology",
                                style: TextStyle(
                                    color: Colors.white54, fontSize: 15),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(10, 0, 10, 2),
                              child: Text(
                                "Warangal",
                                style: TextStyle(
                                    color: Colors.white54,
                                    fontSize: 15,
                                    fontStyle: FontStyle.italic),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
