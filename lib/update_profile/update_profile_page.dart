import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobportal_working/authentication/authentication_bloc.dart';
import 'package:jobportal_working/home/model/dashboard_model.dart';
import 'package:jobportal_working/signup/model/jobseeker_signup.dart';
import 'package:jobportal_working/user_repository/user_repository.dart';
import 'package:jobportal_working/utils/customRaisedCircularButton.dart';
import 'package:jobportal_working/utils/mytoast.dart';

class UpdateProfilePage extends StatefulWidget {
  final UserRepository userRepository;
  final Detail detail;

  UpdateProfilePage(this.userRepository, {this.detail});
  @override
  _UpdateProfilePageState createState() => _UpdateProfilePageState();
}

class _UpdateProfilePageState extends State<UpdateProfilePage> {
  bool isLoading = false;

  final full_name = TextEditingController();
  String gender = 'male';
  DateTime dob;
  final present_address = TextEditingController();
  String country = "India";
  final city = TextEditingController();
  final mobile = TextEditingController();

  void updateField() {
    full_name.text = widget.detail.firstName + widget.detail.lastName;
    gender = widget.detail.gender.toLowerCase();
    mobile.text = widget.detail.mobile;
    //print(widget.detail.gender);
    dob = DateTime.parse(widget.detail.dob);
    present_address.text = widget.detail.presentAddress;
    country = widget.detail.country;
    city.text = widget.detail.city;
  }

  @override
  void initState() {
    super.initState();
    updateField();
  }

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
        dobDay: dob.day.toString(),
        dobMonth: dob.month.toString(),
        dobYear: dob.year.toString(),
        currentAddress: present_address.text,
        country: country,
        city: city.text,
        phone: mobile.text);

    try {
      await widget.userRepository.updateProfile(jobSeekerSignup);

      BlocProvider.of<AuthenticationBloc>(context).add(ViewDashboardEvent());
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
                                        ['male', 'female', 'semi'],
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
                                child: CustomRaisedCircularButton(
                                  onPressed: () async {
                                    dob = await showDatePicker(
                                        context: context,
                                        initialDate: DateTime(1950),
                                        firstDate: DateTime(1950),
                                        lastDate: DateTime.now());

                                    setState(() {});
                                  },
                                  title: dob == null
                                      ? "DOB Update"
                                      : "${dob.day} / ${dob.month} / ${dob.year}",
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
                      isLoading == true
                          ? Center(child: CircularProgressIndicator())
                          : Center(
                              child: CustomRaisedCircularButton(
                                  onPressed: () {
                                    setState(() {
                                      isLoading = true;
                                    });
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
