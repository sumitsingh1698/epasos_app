import 'package:flutter/material.dart';
import 'package:jobportal_working/user_repository/user_repository.dart';
import 'package:jobportal_working/utils/customRaisedCircularButton.dart';
import 'package:jobportal_working/utils/mytoast.dart';

class ChangePassword extends StatefulWidget {
  final UserRepository userRepository;
  ChangePassword(this.userRepository);

  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  bool isLoading = false;

  final oldPasswordTextController = TextEditingController();
  final newPasswordTextController = TextEditingController();
  final newPasswordReenterTextController = TextEditingController();

  Widget getTextFromField(String title, TextEditingController controller) {
    return Container(
      padding: EdgeInsets.all(5.0),
      child: TextField(
          controller: controller,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: ("$title"),
          )),
    );
  }

  Future<void> updatePassword() async {
    try {
      await widget.userRepository.changePassword(oldPasswordTextController.text,
          newPasswordReenterTextController.text);
      setState(() {
        isLoading = false;
      });
      MyToast.showToastMeasgage("Updated Successfully", color: Colors.green);
      Navigator.pop(context);
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      MyToast.showToastMeasgage("$e", color: Colors.red);
    }
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
                    getTextFromField(
                      "Old Password :",
                      oldPasswordTextController,
                    ),

                    getTextFromField(
                      "New Password :",
                      newPasswordTextController,
                    ),
                    getTextFromField(
                        "Confirm Password :", newPasswordReenterTextController),
                    SizedBox(
                      height: 10.0,
                    ),
                    isLoading == true
                        ? Container(
                            child: Center(
                              child: CircularProgressIndicator(),
                            ),
                          )
                        : Center(
                            child: CustomRaisedCircularButton(
                                onPressed: () {
                                  if (newPasswordReenterTextController
                                          .text.length ==
                                      0) {
                                    MyToast.showToastMeasgage(
                                        "password can't be empty");
                                  } else if (newPasswordReenterTextController
                                          .text !=
                                      newPasswordTextController.text) {
                                    MyToast.showToastMeasgage(
                                        "Confirm Password must be same");
                                  } else {
                                    setState(() {
                                      isLoading = true;
                                    });
                                    updatePassword();
                                  }
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
