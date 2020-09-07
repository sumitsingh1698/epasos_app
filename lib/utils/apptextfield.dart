import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  final Icon icon;
  final String label;
  final String hint;
  final bool obscureText;
  AppTextField(
      {@required this.icon,
      @required this.label,
      @required this.hint,
      @required this.obscureText});
  @override
  Widget build(BuildContext context) {
    // return CupertinoTextField(

    //   suffix: Icon(Icons.search),
    // );

    return Container(
      padding: EdgeInsets.symmetric(vertical: 5.0),
      child: TextFormField(
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
