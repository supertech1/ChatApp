import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  String hintText;
  Function onChange;

  CustomTextfield({this.hintText, this.onChange});

  @override
  Widget build(BuildContext context) {
    return TextField(
      textAlign: TextAlign.center,
      style: TextStyle(color: Colors.black),
      onChanged: this.onChange,
      decoration: InputDecoration(
        hintText: this.hintText,
        hintStyle: TextStyle(color: Colors.grey),
        icon: Icon(
          Icons.email,
          color: Colors.lightBlueAccent,
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.lightBlueAccent, width: 1.0),
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
      ),
    );
  }
}
