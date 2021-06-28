import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:lottie/lottie.dart';
import 'package:rentify/Screens/productScreen.dart';
import 'package:rentify/Screens/profile/profilescreen.dart';
import 'package:google_fonts/google_fonts.dart';

class CovidScreen extends StatefulWidget {
  @override
  _CovidScreenState createState() => _CovidScreenState();
}

class _CovidScreenState extends State<CovidScreen> {
  var data = [];
  Future myFuture;
  Future getproducts() async {
    await Future.delayed(Duration(seconds: 0));
    return FirebaseFirestore.instance
        .collection('covid')
        .get()
        .then((value) async {
      for (int i = 0; i < value.docs.length; i++) {
        if (!data.contains(value.docs[i].data())) {
          await data.add(value.docs[i].data());
        }
      }
      print(data.length);
    });
  }

  @override
  void initState() {
    myFuture = getproducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("#191919"),
      body: Container(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          physics: ScrollPhysics(),
          child: Column(
            children: [
              SizedBox(height: 150),
              Container(
                alignment: Alignment.topLeft,
                child: Text(
                  'Products Related to word "Covid"',
                  style: TextStyle(color: Colors.white70, fontSize: 25),
                ),
              ),
              FutureBuilder(
                future: myFuture,
                builder: (BuildContext cont, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: data.length,
                        itemBuilder: (cont, int index) {
                          return GestureDetector(
                            onTap: () {
                              DisplayProducts(
                                data[index]['imageurl'],
                                data[index]['name'],
                                data[index]['price'],
                                data[index]['contactnumber'],
                                data[index]['category'],
                                data[index]['details'],
                              );
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ProductScreen()),
                                  (route) => true);
                            },
                            child: Container(
                                padding: EdgeInsets.all(20),
                                height: 200,
                                child: Row(
                                  children: [
                                    AspectRatio(
                                      aspectRatio: 1 / 1.5,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          image: new DecorationImage(
                                              fit: BoxFit.fill,
                                              image: NetworkImage(
                                                  data[index]["imageurl"])),
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Container(
                                              child: Text(
                                                  data[index]['name']
                                                      .toString()
                                                      .toUpperCase(),
                                                  style: GoogleFonts.alegreya(
                                                      color: Colors.blue[200],
                                                      fontSize: 17,
                                                      fontWeight:
                                                          FontWeight.w600)),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Container(
                                              child: Text(
                                                "${data[index]['price']}/-",
                                                style: GoogleFonts.alegreya(
                                                    color: Colors.white,
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                            )
                                          ],
                                        ),
                                        SizedBox(height: 10),
                                        Container(
                                          child: Text(data[index]['type'],
                                              style: GoogleFonts.aclonica(
                                                  color: Colors.white54)),
                                        )
                                      ],
                                    ),
                                  ],
                                )),
                          );
                        });
                  }
                  return Center(
                      child:
                          Center(child: Lottie.asset('assets/loading.json')));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
