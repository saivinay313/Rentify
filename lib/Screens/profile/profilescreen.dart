import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:rentify/Screens/HomeScreen.dart';
import 'package:rentify/Screens/LoginScreen.dart';
import 'package:rentify/Screens/profile/RentproductScreen.dart';
import 'package:rentify/Screens/profile/userverification.dart';
import 'package:rentify/services/authProvider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

final User user = FirebaseAuth.instance.currentUser;
FirebaseFirestore firestore = FirebaseFirestore.instance;
String uid = user.uid;
Map<String, String> userdetails = {};
String name;
bool userverified = false;

class FireStorageService extends ChangeNotifier {
  FireStorageService();
  static Future<dynamic> loadImage(BuildContext context, String image) async {
    return await FirebaseStorage.instance
        .ref()
        .child("${user.uid}")
        .child(image)
        .getDownloadURL();
  }
}

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final storage = FirebaseStorage.instance;
  PickedFile _image;
  var imageurl;

  final picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    final auth = AuthProvider.of(context);
    Future<Widget> _getimage(BuildContext context, String imagename) async {
      Image img;
      await FireStorageService.loadImage(context, imagename).then((value) {
        imageurl = value.toString();
        img = Image.network(
          value.toString(),
          fit: BoxFit.scaleDown,
        );
      });

      return img;
    }

    Future<void> pickimage() async {
      _image = await picker.getImage(source: ImageSource.gallery);
      var file = File(_image.path);
      if (file != null) {
        var uploadtask = storage
            .ref()
            .child("${user.uid}")
            .child('profilepic.jpeg')
            .putFile(file)
            .then((_) {
          setState(() {});
        });
      }
    }

    Future<String> _userdetails() async {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get()
          .then((value) {
        name = value['name'];
        userverified = value['userverification'];
        //userverified = value['verification'];
      });
      return name;
    }

    return Scaffold(
      backgroundColor: HexColor("#191919"),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      iconSize: 30,
                      icon: Icon(
                        Icons.arrow_back,
                        color: HexColor("#FF8000"),
                      ),
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeScreen()),
                            (route) => false);
                      }),
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 15, 20, 0),
                    alignment: Alignment.topRight,
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.shopping_cart_outlined,
                        color: HexColor("#FF8000"),
                        size: 30,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                height: 200,
                child: Center(
                  child: Container(
                    child: FutureBuilder(
                        future: _getimage(context, "profilepic.jpeg"),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.done) {
                            if (snapshot.data != null) {
                              return Container(
                                height: 175,
                                width: 175,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  boxShadow: [
                                    BoxShadow(
                                        blurRadius: 5, color: Colors.white)
                                  ],
                                  shape: BoxShape.circle,
                                  image: new DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(imageurl)),
                                ),
                              );
                            } else {
                              return Stack(
                                children: [
                                  new Center(
                                    child: CircleAvatar(
                                      radius: 75,
                                      backgroundColor: Colors.black,
                                      child: new Center(
                                          child: IconButton(
                                        iconSize: 60,
                                        onPressed: () async {
                                          await pickimage();
                                        },
                                        icon: Icon(
                                          Icons.add_a_photo,
                                          color: Colors.white60,
                                        ),
                                      )),
                                    ),
                                  ),
                                ],
                              );
                            }
                          }
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return CircularProgressIndicator();
                          }
                          return Container();
                        }),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                alignment: Alignment.center,
                child: FutureBuilder(
                  future: _userdetails(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      if (snapshot.hasData) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              child: Text(
                                snapshot.data.toString().toUpperCase(),
                                style: TextStyle(
                                    color: Colors.white70,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 20),
                              ),
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Container(
                              height: 25,
                              child: FittedBox(
                                fit: BoxFit.cover,
                                child: userverified
                                    ? Icon(
                                        Icons.verified,
                                        color: Colors.green,
                                      )
                                    : Icon(
                                        Icons.not_interested_outlined,
                                        color: Colors.red,
                                      ),
                              ),
                            ),
                          ],
                        );
                      } else {
                        return Container(
                          child: Text("Loading"),
                        );
                      }
                    } else {
                      return Container(
                        height: 200,
                      );
                    }
                  },
                ),
              ),
              SizedBox(
                height: 60,
              ),
              Container(
                decoration: BoxDecoration(
                  color: HexColor("#FF8000"),
                  borderRadius: BorderRadius.circular(12),
                ),
                height: 60,
                width: 210,
                child: Material(
                  color: HexColor("#FF8000"),
                  borderRadius: BorderRadius.circular(12),
                  child: InkWell(
                    splashFactory: InkRipple.splashFactory,
                    borderRadius: BorderRadius.circular(12),
                    splashColor: Colors.white30,
                    onTap: () {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LendProduct()),
                          (route) => true);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.camera,
                          color: Colors.black87,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          "Rent a product",
                          style: TextStyle(color: Colors.black87, fontSize: 20),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              userverified
                  ? Container(
                      child: Text(
                        'Account Verified, Congrats',
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  : Container(
                      decoration: BoxDecoration(
                        color: HexColor("#FF8000"),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      height: 60,
                      width: 210,
                      child: Material(
                        color: HexColor("#FF8000"),
                        borderRadius: BorderRadius.circular(12),
                        child: InkWell(
                          splashFactory: InkRipple.splashFactory,
                          borderRadius: BorderRadius.circular(12),
                          splashColor: Colors.white30,
                          onTap: () {
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      AccountVerification(),
                                ),
                                (route) => false);
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.verified_user_outlined,
                                color: Colors.black87,
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Text(
                                "Verify Your Account",
                                style: TextStyle(
                                    color: Colors.black87, fontSize: 15),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
              SizedBox(
                height: 50,
              ),
              GestureDetector(
                onTap: () {
                  return showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          backgroundColor: HexColor("#191919"),
                          title: Text(
                            "Log out",
                            style: TextStyle(color: Colors.white),
                          ),
                          content: Text("Are You sure u want to Logout?",
                              style: TextStyle(color: Colors.white)),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop(false);
                                },
                                child: Text("Cancel",
                                    style: TextStyle(color: Colors.white))),
                            TextButton(
                                onPressed: () {
                                  auth.signout().then((value) {
                                    Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                LoginScreen()),
                                        (route) => false);
                                  });
                                },
                                child: Text('Log out',
                                    style: TextStyle(color: Colors.white)))
                          ],
                        );
                      });
                },
                child: Container(
                  child: Text(
                    'Logout',
                    style: TextStyle(color: HexColor('#FF8000'), fontSize: 20),
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
