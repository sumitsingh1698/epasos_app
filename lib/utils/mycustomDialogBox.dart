import 'package:flutter/material.dart';

import 'customRaisedCircularButton.dart';

class MyCustomDialog extends StatefulWidget {
  static showMe(
      {@required BuildContext context,
      @required String title,
      @required Widget widgets,
      @required Function onSubmit}) {
    showDialog(
        context: context, child: MyCustomDialog(title, widgets, onSubmit));
  }

  MyCustomDialog(this.title, this.widgets, this.onSubmit, {Key key})
      : super(key: key);
  final String title;
  final Widget widgets;
  final Function onSubmit;

  @override
  _MyCustomDialogState createState() => _MyCustomDialogState();
}

class _MyCustomDialogState extends State<MyCustomDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(130.0),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              AppBar(
                automaticallyImplyLeading: false,
                title: Center(child: Text("${widget.title}")),
              ),
              Container(
                child: widget.widgets,
              ),
              Container(
                padding: EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CustomRaisedCircularButton(
                        onPressed: widget.onSubmit,
                        width: 100,
                        title: "Submit"),
                    SizedBox(
                      width: 10.0,
                    ),
                    CustomRaisedCircularButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        color: Colors.grey[500],
                        width: 100,
                        title: "Close"),
                    SizedBox(
                      width: 10.0,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
