import 'package:epasos/pages/home.dart';
import 'package:epasos/utils/customRaisedCircularButton.dart';
import 'package:flutter/material.dart';

class ChangePassword extends StatefulWidget {
  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  Widget getTextFromField(String text, String title) {
    return Container(
      padding: EdgeInsets.all(5.0),
      child: TextFormField(
          initialValue: "$text",
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: ("$title"),
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Change Password      ")),
        // actions: [IconButton(icon: Icon(Icons.home), onPressed: () {})],
      ),
      backgroundColor: Colors.grey[300],
      body: Center(
        child: SingleChildScrollView(
          child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
                side: BorderSide(
                    color: Theme.of(context).primaryColor, width: 5.0)),
            margin: EdgeInsets.all(10.0),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
              child: Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // getTitleText("Full Nam "),
                    getTextFromField("", "Old Password :"),

                    getTextFromField("", "New Password :"),
                    getTextFromField("", "Confirm Password :"),
                    SizedBox(
                      height: 10.0,
                    ),
                    Center(
                      child: CustomRaisedCircularButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Home()));
                          },
                          title: "Update"),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
