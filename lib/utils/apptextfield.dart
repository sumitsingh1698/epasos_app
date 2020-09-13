import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTextField extends StatelessWidget {
  final Icon icon;
  final String label;
  final String hint;
  final bool obscureText;
  final maxLine;
  final TextEditingController controller;
  TextInputType textInputType;

  AppTextField(
      {@required this.icon,
      @required this.label,
      @required this.hint,
      @required this.obscureText,
      @required this.controller,
      this.maxLine = 1,
      this.textInputType = TextInputType.text});
  @override
  Widget build(BuildContext context) {
    // return CupertinoTextField(

    //   suffix: Icon(Icons.search),
    // );

    return Container(
      padding: EdgeInsets.symmetric(vertical: 5.0),
      child: TextField(
        keyboardType: textInputType,
        controller: controller,
        maxLines: maxLine,
        obscureText: obscureText,
        decoration: InputDecoration(
          isDense: true,
          hintStyle: TextStyle(color: Colors.grey[500]),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(40.0)),
          suffixIcon: icon,
          hintText: hint,
        ),
      ),
    );
  }
}
