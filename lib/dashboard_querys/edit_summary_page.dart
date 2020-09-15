import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:jobportal_working/user_repository/user_repository.dart';
import 'package:jobportal_working/utils/mycustomDialogBox.dart';

class EditSummaryPage extends StatefulWidget {
  final UserRepository userRepository;
  final String initalValue;
  final int userType;
  EditSummaryPage(this.initalValue, this.userType, this.userRepository);

  @override
  _EditSummaryPageState createState() => _EditSummaryPageState();
}

class _EditSummaryPageState extends State<EditSummaryPage> {
  final summaryTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    summaryTextController.text = widget.initalValue;
    return MyCustomDialog.showMe(
        context: context,
        title: "Professional Summary",
        widgets: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          child: TextField(
            controller: summaryTextController,
            minLines: 5,
            maxLines: 5,
          ),
        ),
        onSubmit: widget.userType == 1
            ? () {
                print("usertype 1");
              }
            : () {
                print("userType 2");
              });
    ;
  }
}
