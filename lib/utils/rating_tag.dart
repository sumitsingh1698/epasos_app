import 'package:flutter/material.dart';

class RatingTag extends StatelessWidget {
  final String rating;
  RatingTag({@required this.rating});
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: new BorderRadius.circular(2.0),
        child: new Container(
          width: 50.0,
          decoration:
              new BoxDecoration(color: Color.fromRGBO(0, 162, 255, 0.77)),
          padding: EdgeInsets.all(3.0),
          margin: EdgeInsets.only(left: 10.0, top: 10.0),
          child: Row(
            children: <Widget>[
              new Icon(
                Icons.star,
                color: Colors.white,
                size: 15.0,
              ),
              new Container(
                padding: EdgeInsets.only(left: 3.0),
              ),
              new Text(
                rating,
                style: new TextStyle(color: Colors.white, fontSize: 12.0),
              ),
            ],
          ),
        ));
  }
}
