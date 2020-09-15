import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobportal_working/authentication/authentication_bloc.dart';
import 'package:jobportal_working/signup/bloc/signup_bloc.dart';
import 'package:jobportal_working/signup/model/jobseeker_signup.dart';
import 'package:jobportal_working/user_repository/user_repository.dart';
import 'package:jobportal_working/utils/customRaisedCircularButton.dart';
import 'package:jobportal_working/utils/mytoast.dart';

class UpdateProfilePage extends StatefulWidget {
  final UserRepository userRepository;

  UpdateProfilePage(this.userRepository);
  @override
  _UpdateProfilePageState createState() => _UpdateProfilePageState();
}

class _UpdateProfilePageState extends State<UpdateProfilePage> {
  bool isLoading = false;

  final full_name = TextEditingController();
  String gender = 'Male';
  String dob_day = '01';
  String dob_month = '01';
  String dob_year = '2000';
  final present_address = TextEditingController();
  String country = "India";
  final city = TextEditingController();
  final mobile = TextEditingController();

  Widget getTitleText(String text) {
    return Container(
      padding: EdgeInsets.all(5.0),
      child: Text(
        "$text",
        style: TextStyle(fontSize: 18),
      ),
    );
  }

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

  Widget getDropDownButton(
      List<String> items, String hint, String intail, Function onChange) {
    return Container(
        padding: EdgeInsets.all(5.0),
        child: DropdownButton<String>(
          hint: Text(hint),
          value: intail,
          icon: Icon(Icons.arrow_downward),
          iconSize: 24,
          elevation: 16,
          style: TextStyle(
            color: Colors.black,
          ),
          underline: Container(
            height: 2,
            color: Theme.of(context).primaryColor,
          ),
          onChanged: onChange,
          items: items.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ));
  }

  Future<void> onPressedUpdateButton() async {
    JobSeekerSignup jobSeekerSignup = JobSeekerSignup(
        fullName: full_name.text,
        gender: gender,
        dobDay: dob_day,
        dobMonth: dob_month,
        dobYear: dob_year,
        currentAddress: present_address.text,
        country: country,
        city: city.text,
        phone: mobile.text);

    try {
      await widget.userRepository.updateProfile(jobSeekerSignup);
      setState(() {
        isLoading = false;
      });
      BlocProvider.of<AuthenticationBloc>(context).add(BackToHomeEvent());
      MyToast.showToastMeasgage("Updated Successfully", color: Colors.green);
      Navigator.pop(context);
    } catch (e) {
      MyToast.showToastMeasgage("$e", color: Colors.red);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("My Account")),
        actions: [
          IconButton(
              icon: Icon(Icons.home),
              onPressed: () {
                Navigator.pop(context);
              })
        ],
      ),
      body: isLoading == true
          ? Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            )
          : SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(10.0),
                child: Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // getTitleText("Full Nam "),
                      getTextFromField("Full Name", full_name),

                      getTextFromField("Mobile No", mobile),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(flex: 1, child: getTitleText("Gender :")),
                          Expanded(
                            flex: 2,
                            child: Container(
                                padding: EdgeInsets.only(right: 30.0),
                                child: Row(
                                  children: [
                                    getDropDownButton(
                                        ['Male', 'Female', 'Semi'],
                                        "Gender",
                                        gender, (value) {
                                      setState(() {
                                        gender = value;
                                      });
                                    }),
                                  ],
                                )),
                          ),
                        ],
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                              flex: 1, child: getTitleText("Date of Birth :")),
                          Expanded(
                            flex: 2,
                            child: Container(
                                padding: EdgeInsets.only(right: 30.0),
                                child: Row(
                                  children: [
                                    getDropDownButton(
                                        ['01', '02', '03'], "DOB", dob_day,
                                        (value) {
                                      setState(() {
                                        dob_day = value;
                                      });
                                    }),
                                    getDropDownButton(
                                        ['01', '02', '03', '04', '05'],
                                        "DOB",
                                        dob_month, (value) {
                                      setState(() {
                                        dob_month = value;
                                      });
                                    }),
                                    getDropDownButton(["2000", "2019", "2020"],
                                        "DOB", dob_year, (value) {
                                      setState(() {
                                        dob_year = value;
                                      });
                                    }),
                                  ],
                                )),
                          ),
                        ],
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(flex: 1, child: getTitleText("Location :")),
                          Expanded(
                            flex: 2,
                            child: Container(
                                padding: EdgeInsets.only(right: 30.0),
                                child: Row(
                                  children: [
                                    getDropDownButton(
                                        ['Austraila', 'India', 'China'],
                                        "Location",
                                        country, (value) {
                                      setState(() {
                                        country = value;
                                      });
                                    }),
                                  ],
                                )),
                          ),
                        ],
                      ),
                      getTextFromField("City :", city),
                      Container(
                        padding: EdgeInsets.all(5.0),
                        child: TextField(
                          controller: present_address,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: ("Address :"),
                          ),
                          maxLines: 2,
                        ),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Center(
                          child: CustomRaisedCircularButton(
                              onPressed: () {
                                onPressedUpdateButton();
                              },
                              title: "Update"))
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
