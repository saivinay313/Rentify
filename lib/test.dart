import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';

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

class Test extends StatefulWidget {
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {  
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
    return Container(
      
    );
  }
}