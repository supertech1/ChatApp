import 'package:flutter/material.dart';

class Custom_Botton extends StatelessWidget {
  Color bgColor;
  Function onPress;
  String text;
  Custom_Botton(
      {@required this.text, @required this.bgColor, @required this.onPress});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: bgColor, // Colors.lightBlueAccent,
      borderRadius: BorderRadius.circular(30.0),
      elevation: 5.0,
      child: MaterialButton(
        onPressed: onPress,
        minWidth: 200.0,
        height: 42.0,
        child: Text(
          text,
        ),
      ),
    );
  }
}
