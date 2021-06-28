import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:rentify/Screens/uploadproduct.dart';

var name;
var imageurl;
var contactnumber;
var price;
var productdetails;
var catergory;

class ProductScreen extends StatefulWidget {
  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class DisplayProducts {
  var catergory1;
  var name1;
  var imageurl1;
  var contactnumber1;
  var price1;
  var productdetails1;
  DisplayProducts(this.imageurl1, this.name1, this.price1, this.contactnumber1,
      this.catergory1, this.productdetails1) {
    name = name1;
    imageurl = imageurl1;
    contactnumber = contactnumber1;
    price = price1;
    productdetails = productdetails1;
    category = catergory1;
  }
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: HexColor("#191919"),
        body: Container(
          padding: EdgeInsets.all(15),
          child: Column(
            children: [
              SizedBox(
                height: 100,
              ),
              Container(
                padding: EdgeInsets.fromLTRB(0, 0, 30, 0),
                alignment: Alignment.topRight,
                child: Icon(
                  Icons.bookmark_outline,
                  color: Colors.white,
                  size: 35,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                  alignment: Alignment.center,
                  child: Card(
                    elevation: 5,
                    shadowColor: Colors.white38,
                    child: AspectRatio(
                      aspectRatio: 1 / 0.5,
                      child: Image(
                        fit: BoxFit.contain,
                        image: NetworkImage(imageurl),
                      ),
                    ),
                  )),
              SizedBox(
                height: 20,
              ),
              Container(
                alignment: Alignment.center,
                child: Text(name,
                    style: GoogleFonts.raleway(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold)),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.all(10),
                alignment: Alignment.topLeft,
                child: Text(
                  "₹ $price/-",
                  style: TextStyle(color: Colors.white, fontSize: 35),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                alignment: Alignment.topLeft,
                child: Text(" ContactNumber: $contactnumber",
                    style: GoogleFonts.abel(color: Colors.white, fontSize: 20)),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                alignment: Alignment.topLeft,
                child: Text(
                  'Details',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                alignment: Alignment.topLeft,
                child: Text(
                  productdetails,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontStyle: FontStyle.italic),
                ),
              ),
            ],
          ),
        ));
  }
}
