import 'package:flutter/material.dart';

class AdditionalDashboardWidget extends StatelessWidget {
  final String title;
  final String result;
  AdditionalDashboardWidget({@required this.title, @required this.result});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Row(
            children: [
              Expanded(
                flex: 3,
                child: Container(
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      // fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Expanded(
                  flex: 1,
                  child: Container(
                    child: Text(":"),
                  )),
              Expanded(
                flex: 7,
                child: Container(
                  child: Text(
                    result,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                      // fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Divider(
            color: Colors.grey[600],
          ),
        ],
      ),
    );
  }
}
