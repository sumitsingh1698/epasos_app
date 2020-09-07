import 'package:flutter/material.dart';

class CustomRaisedCircularButton extends StatelessWidget {
  final Function onPressed;
  final String title;
  final Color color;
  final double width;
  CustomRaisedCircularButton(
      {@required this.onPressed, @required this.title, this.color, this.width});
  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      buttonColor: color != null ? color : Theme.of(context).primaryColor,
      minWidth: width != null ? width : 200.0,
      child: RaisedButton(
          child: Text(
            "$title",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          onPressed: onPressed,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
          )),
    );
  }
}
