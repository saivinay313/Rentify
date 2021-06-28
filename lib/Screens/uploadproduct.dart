import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:rentify/Screens/productScreen.dart';

var producttuid;
String useruid;
var url;
String category = 'None';
String type = "None";
List producttype = ['sale', "rent", 'None'];
List productcat = ["covid", 'Mobiles', 'Electronics', "Books", "None"];
final _formkey = GlobalKey<FormState>();
final productnamecontroller = TextEditingController();
final productndescriptioncontroller = TextEditingController();
final priceecontroller = TextEditingController();
final phonenumbercontroller = TextEditingController();

Future submitdata(String productname, String productdescription, String price,
    String contactnumber, String type, String category, String imageurl) {
  final User user = FirebaseAuth.instance.currentUser;
  useruid = user.uid;
  return FirebaseFirestore.instance.collection('books').add({
    "price": price,
    "name": productname,
    "contactnumber": contactnumber,
    "type": type,
    "details": productdescription,
    "category": category,
    "imageurl": imageurl
  });
}

Future coviddata(String productname, String productdescription, String price,
    String contactnumber, String type, String category, String imageurl) {
  final User user = FirebaseAuth.instance.currentUser;
  useruid = user.uid;
  return FirebaseFirestore.instance.collection('covid').add({
    "price": price,
    "name": productname,
    "contactnumber": contactnumber,
    "type": type,
    "details": productdescription,
    "category": category,
    "imageurl": imageurl
  });
}

class UploadProduct extends StatefulWidget {
  @override
  _UploadProductState createState() => _UploadProductState();
}

class GetImageDetails {
  var imagename;
  var imageurl;
  GetImageDetails(this.imagename, this.imageurl) {
    producttuid = imagename;
    url = imageurl;
  }
}

class _UploadProductState extends State<UploadProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: HexColor('#191919'),
        body: Container(
          padding: EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Form(
              key: _formkey,
              child: Column(
                children: [
                  SizedBox(
                    height: 150,
                  ),
                  Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(12)),
                    child: AspectRatio(
                        aspectRatio: 1 / 0.4,
                        child: Image(
                          image: NetworkImage(url),
                          fit: BoxFit.contain,
                        )),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Edit Image',
                        style: TextStyle(color: Colors.white70, fontSize: 20),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.edit,
                        color: Colors.white70,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Product Name',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.black,
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: TextFormField(
                        cursorColor: Colors.white,
                        controller: productnamecontroller,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Name must be provided';
                          }
                          return null;
                        },
                        style: TextStyle(color: Colors.white, fontSize: 20),
                        decoration: InputDecoration(
                          focusColor: Colors.black,
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          hintStyle: TextStyle(
                              color: Colors.white70,
                              fontStyle: FontStyle.italic,
                              fontSize: 15),
                          hintText: "  Please provide valid name",

                          //labelText: "Email",
                          labelStyle: TextStyle(color: Colors.white70),
                        )),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Product Description',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: TextFormField(
                        cursorColor: Colors.white,
                        controller: productndescriptioncontroller,
                        validator: (value) {
                          if (value.isEmpty || value.length > 100) {
                            return 'Name must be provided';
                          }
                          return null;
                        },
                        style: TextStyle(color: Colors.white, fontSize: 20),
                        decoration: InputDecoration(
                          focusColor: Colors.black,
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          hintStyle: TextStyle(
                              color: Colors.white70,
                              fontStyle: FontStyle.italic,
                              fontSize: 15),
                          hintText: "  Description to be less than 100 words",
                          //labelText: "Email",
                          labelStyle: TextStyle(color: Colors.white70),
                        )),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Price of product',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.black,
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: TextFormField(
                        cursorColor: Colors.white,
                        controller: priceecontroller,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Price must be provided';
                          }
                          return null;
                        },
                        style: TextStyle(color: Colors.white, fontSize: 20),
                        decoration: InputDecoration(
                          focusColor: Colors.black,
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          hintStyle: TextStyle(
                              color: Colors.white70,
                              fontStyle: FontStyle.italic,
                              fontSize: 15),
                          hintText: "  Price",

                          //labelText: "Email",
                          labelStyle: TextStyle(color: Colors.white70),
                        )),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Contact number',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.black,
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: TextFormField(
                        cursorColor: Colors.white,
                        controller: phonenumbercontroller,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Must be 10digits';
                          }
                          return null;
                        },
                        style: TextStyle(color: Colors.white, fontSize: 20),
                        decoration: InputDecoration(
                          focusColor: Colors.black,
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          hintStyle: TextStyle(
                              color: Colors.white70,
                              fontStyle: FontStyle.italic,
                              fontSize: 15),
                          hintText: "  Please Provide valid mobile number",

                          //labelText: "Email",
                          labelStyle: TextStyle(color: Colors.white70),
                        )),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Product type',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    height: 70,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(12)),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        dropdownColor: Colors.black,
                        style: TextStyle(color: Colors.black),
                        focusColor: Colors.black,
                        value: type,
                        items: producttype.map((e) {
                          return DropdownMenuItem(
                            value: e,
                            child: Text(
                              e,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            type = value;
                          });
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Product Category',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    height: 70,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(12)),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        dropdownColor: Colors.black,
                        style: TextStyle(color: Colors.black),
                        focusColor: Colors.black,
                        value: category,
                        items: productcat.map((e) {
                          return DropdownMenuItem(
                            value: e,
                            child: Text(
                              e,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          );
                        }).toList(),
                        onChanged: (value2) {
                          setState(() {
                            category = value2;
                          });
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  GestureDetector(
                    onTap: () async {
                      if (_formkey.currentState.validate()) {
                        await submitdata(
                                productnamecontroller.text,
                                productndescriptioncontroller.text,
                                priceecontroller.text,
                                phonenumbercontroller.text,
                                type,
                                category,
                                url)
                            .then((value) async {
                          if (category == "covid") {
                            await coviddata(
                                productnamecontroller.text,
                                productndescriptioncontroller.text,
                                priceecontroller.text,
                                phonenumbercontroller.text,
                                type,
                                category,
                                url);
                          }
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text('Submitted Up Successfully!')));

                          Navigator.pop(context);
                        });
                      }
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 50,
                      width: 100,
                      child: Text(
                        'Submit',
                        style:
                            TextStyle(color: HexColor('#FF8000'), fontSize: 20),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
