import 'package:flutter/material.dart';

class HeadingOfPages extends StatelessWidget {
  final String text;
  HeadingOfPages({@required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      "$text",
      style: TextStyle(
          color: Colors.black, fontSize: 18.0, fontWeight: FontWeight.bold),
    );
  }
}
