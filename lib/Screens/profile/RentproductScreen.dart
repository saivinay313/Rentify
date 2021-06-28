import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';

import 'package:rentify/Screens/productdetails.dart';
import 'package:rentify/Screens/uploadproduct.dart';

var imageurl;
var imagename = DateTime.now().toString();
var data;
bool img = false;

class LendProduct extends StatefulWidget {
  @override
  _LendProductState createState() => _LendProductState();
}

class FireStorageService extends ChangeNotifier {
  FireStorageService();
  static Future<dynamic> loadImage() async {
    return await FirebaseStorage.instance
        .ref()
        .child("${user.uid}")
        .child(imagename)
        .getDownloadURL();
  }
}

Future<void> senddata() async {
  Image img;
  await FireStorageService.loadImage().then((value) {
    imageurl = value.toString();
    GetImageDetails(imagename, imageurl);
    FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .collection('rent')
        .doc(imagename)
        .set({'$imagename': imageurl});
  });
}

final User user = FirebaseAuth.instance.currentUser;

class _LendProductState extends State<LendProduct> {
  final storage = FirebaseStorage.instance;
  PickedFile _image;
  var imageurl;

  final picker = ImagePicker();

  Future<void> pickimage() async {
    _image = await picker.getImage(source: ImageSource.gallery);
    var file = File(_image.path);
    if (file != null) {
      var uploadtask = storage
          .ref()
          .child("${user.uid}")
          .child('$imagename')
          .putFile(file)
          .then((_) {
        img = true;
        senddata();
        setState(() {});
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('#191919'),
      body: Container(
        width: double.infinity,
        decoration: new BoxDecoration(color: HexColor('#191919')),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 200,
              ),
              Container(
                child: Text(
                  'Upload a product',
                  style: GoogleFonts.aclonica(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              GestureDetector(
                onTap: () async {
                  print('tapped');
                },
                child: Container(
                  padding: EdgeInsets.all(20),
                  height: 110,
                  width: 350,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.camera_alt_outlined,
                        size: 45,
                        color: HexColor("#FF8000"),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Text(
                        "Take Image",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              GestureDetector(
                onTap: () async {
                  await pickimage();
                },
                child: Container(
                  padding: EdgeInsets.all(20),
                  height: 110,
                  width: 350,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.file_upload,
                        size: 45,
                        color: HexColor("#FF8000"),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      img
                          ? Text("Uploaded",
                              style: TextStyle(
                                fontSize: 20,
                                color: HexColor('#FF8000'),
                              ))
                          : Text(
                              "Browse from files",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  letterSpacing: 0.5),
                            ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 50),
              Container(
                  alignment: Alignment.center,
                  child: IconButton(
                    onPressed: () {
                      if (img) {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => UploadProduct()),
                            (route) => true);
                      }
                    },
                    icon: Icon(
                      Icons.arrow_forward,
                      color: HexColor('#FF8000'),
                    ),
                    iconSize: 40,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
