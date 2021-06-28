import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatePicker extends StatefulWidget {
  String date;
  DatePicker({Key key, this.date}) : super(key: key);

  @override
  _DatePickerState createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  var pickeddate;
  void datepicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(1988),
            lastDate: DateTime.now())
        .then((value) {
      setState(() {
        pickeddate = DateFormat.yMd(value).toString();
        widget.date = pickeddate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      pickeddate == null ? "Choose your DOB" : widget.date,
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 15,
      ),
    );
  }
}
