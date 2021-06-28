import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';

import 'package:rentify/Screens/profile/profilescreen.dart';

final User user = FirebaseAuth.instance.currentUser;

class FireStorageService extends ChangeNotifier {
  FireStorageService();
  static Future<dynamic> loadImage(
      BuildContext context, String filename) async {
    return await FirebaseStorage.instance
        .ref()
        .child("${user.uid}")
        .child(filename)
        .getDownloadURL();
  }
}

class AccountVerification extends StatefulWidget {
  @override
  _AccountVerificationState createState() => _AccountVerificationState();
}

class _AccountVerificationState extends State<AccountVerification> {
  @override
  Widget build(BuildContext context) {
    String name;
    final User user = FirebaseAuth.instance.currentUser;
    final storage = FirebaseStorage.instance;
    String _adharimageurl;

    Future<File> _getfile(BuildContext context, String filename) async {
      File file;
      await FireStorageService.loadImage(context, filename).then((value) {
        file = File(value.toString());
      });
      return file;
    }

    Future<void> pickfile(String upname) async {
      FilePickerResult result = await FilePicker.platform.pickFiles(
          allowCompression: true,
          type: FileType.custom,
          allowedExtensions: ['pdf', 'doc'],
          onFileLoading: (_) {
            return Container(
              child: CircularProgressIndicator(),
            );
          });
      if (result != null) {
        File file = File(result.files.single.path);
        PlatformFile upfile = result.files.first;
        var uploadtask = storage
            .ref()
            .child("${user.uid}")
            .child(upname)
            .putFile(file)
            .then((_) {
          name = upfile.name;
          setState(() {});
        });
      }
    }

    return Scaffold(
      backgroundColor: HexColor("#191919"),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 200,
            ),
            Container(
              child: Text(
                'Account Verification',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              padding: EdgeInsets.all(12),
              child: Text(
                'Upload Your Adhar Card Image',
                style: TextStyle(
                    color: Colors.white70, fontWeight: FontWeight.w300),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(12),
              ),
              height: 60,
              width: 500,
              child: FutureBuilder(
                future: _getfile(context, "adharcard"),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.data != null) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.file_copy,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            "Uploaded",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      );
                    } else {
                      return GestureDetector(
                        onTap: () async {
                          await pickfile("adharcard");
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.camera,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              "Upload File",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      );
                    }
                  } else {
                    return Container();
                  }
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.all(12),
              child: Text(
                'Upload Your University Id card Image',
                style: TextStyle(
                    color: Colors.white70, fontWeight: FontWeight.w300),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(12),
              ),
              height: 60,
              width: 500,
              child: FutureBuilder(
                future: _getfile(context, "University Id card"),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.data != null) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.file_copy,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            "Uploaded",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      );
                    } else {
                      return GestureDetector(
                        onTap: () async {
                          await pickfile("University Id card");
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.camera,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              "Upload File",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      );
                    }
                  } else {
                    return Container();
                  }
                },
              ),
            ),
            SizedBox(
              height: 100,
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                  alignment: Alignment.center,
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.black,
                  ),
                  child: IconButton(
                    iconSize: 30,
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProfileScreen()),
                          (route) => false);
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: HexColor("#FF8000"),
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
