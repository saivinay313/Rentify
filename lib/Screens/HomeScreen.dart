import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:rentify/Screens/covidscreen.dart';
import 'package:rentify/Screens/productScreen.dart';
import 'package:rentify/Screens/profile/profilescreen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var data = [];
  var electronics = [];
  Future myFuture;
  Future getbooks() async {
    await Future.delayed(Duration(seconds: 0));
    return FirebaseFirestore.instance
        .collection('books')
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
    myFuture = getbooks();
    super.initState();
  }

  var searchcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("#191919"),
      body: Container(
        padding: EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 75,
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.all(5),
                  child: Container(
                    child: Row(
                      children: [
                        Container(
                          child: TextField(
                            style: TextStyle(color: Colors.white70),
                            controller: searchcontroller,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintStyle: TextStyle(
                                  color: Colors.white70,
                                  fontStyle: FontStyle.italic,
                                  fontSize: 15),
                              hintText: "Search for Product",
                              prefixIcon: Icon(
                                Icons.search,
                                color: Colors.white70,
                              ),
                            ),
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.black45,
                          ),
                          height: 50,
                          width: 275,
                        ),
                        Container(
                          child: IconButton(
                            splashRadius: 30,
                            onPressed: () {
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ProfileScreen()),
                                  (route) => false);
                            },
                            iconSize: 55,
                            splashColor: HexColor("#FF8000"),
                            icon: Icon(
                              Icons.person,
                              color: HexColor("#FF8000"),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                dragStartBehavior: DragStartBehavior.start,
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CovidScreen()),
                            (route) => true);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          color: Colors.white,
                        ),
                        height: 40,
                        width: 90,
                        child: Text(
                          'Covid',
                          style: TextStyle(
                              color: Colors.red,
                              fontSize: 17,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          color: Colors.white54,
                        ),
                        height: 40,
                        width: 90,
                        child: Text(
                          'Books',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 17,
                              fontWeight: FontWeight.w300),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          color: Colors.white54,
                        ),
                        height: 40,
                        width: 90,
                        child: Text(
                          'Cycles',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 17,
                              fontWeight: FontWeight.w300),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          color: Colors.white54,
                        ),
                        height: 40,
                        width: 100,
                        child: Text(
                          'Electronics',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 17,
                              fontWeight: FontWeight.w300),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          color: Colors.white54,
                        ),
                        height: 40,
                        width: 90,
                        child: Text(
                          'Travel',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 17,
                              fontWeight: FontWeight.w300),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          color: Colors.white54,
                        ),
                        height: 40,
                        width: 90,
                        child: Text(
                          'Mobiles',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 17,
                              fontWeight: FontWeight.w300),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 25,
              ),
              SingleChildScrollView(
                physics: ScrollPhysics(),
                child: FutureBuilder(
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
                                  height: 150,
                                  child: Row(
                                    children: [
                                      AspectRatio(
                                        aspectRatio: 1 / 1.4,
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
                                                      fontSize: 19,
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
                      child: Lottie.asset('assets/loading.json'),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
