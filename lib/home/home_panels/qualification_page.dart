import 'package:flutter/material.dart';
import 'package:jobportal_working/home/model/dashboard_model.dart';
import 'package:jobportal_working/user_repository/user_repository.dart';
import 'package:jobportal_working/utils/appdropboxbutton.dart';
import 'package:jobportal_working/utils/apptextfield.dart';
import 'package:jobportal_working/utils/customRaisedCircularButton.dart';
import 'package:jobportal_working/utils/mytoast.dart';

class QualificationPage extends StatefulWidget {
  final UserRepository userRepository;
  final Qualification qualification;

  QualificationPage(this.userRepository, {this.qualification});

  @override
  _QualificationPageState createState() => _QualificationPageState();
}

class _QualificationPageState extends State<QualificationPage> {
  bool isLoading = false;
  String degreeTitle = 'BBA';
  final majorSubjectTextController = TextEditingController();
  final instituteTextController = TextEditingController();
  final cityTextController = TextEditingController();
  DateTime qualificationEndDateTime = DateTime.now();

  String countryInput = "india";

  void updateFieldByData() {
    isLoading = false;
    degreeTitle = widget.qualification.degreeTitle;
    majorSubjectTextController.text = widget.qualification.major;
    instituteTextController.text = widget.qualification.institude;
    cityTextController.text = widget.qualification.city;
    print(widget.qualification.completionYear);
    qualificationEndDateTime =
        DateTime(int.parse(widget.qualification.completionYear));

    countryInput = widget.qualification.country.toLowerCase();
  }

  @override
  initState() {
    if (widget.qualification != null) {
      updateFieldByData();
    }
    super.initState();
  }

  Future<void> addUpdateQualification() async {
    isLoading = true;

    try {
      // add Update Qualification
      widget.userRepository.addUpdateQualification(Qualification(
        iD: widget.qualification == null ? null : widget.qualification.iD,
        degreeTitle: degreeTitle,
        major: majorSubjectTextController.text,
        institude: instituteTextController.text,
        country: countryInput,
        city: cityTextController.text,
        completionYear: qualificationEndDateTime.year.toString(),
      ));
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
          title: Text("Qualification"),
        ),
        body: Center(
            child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(30.0),
            child: Column(children: [
              Container(
                child: Column(
                  children: [
                    AppDropDownBox(
                      onChange: (value) {
                        setState(() {
                          degreeTitle = value;
                        });
                      },
                      list: ["BBA", "B-Tech", "B-Com", "B-Sc", "Certification"],
                      hint: "",
                      intialValue: degreeTitle,
                      width: MediaQuery.of(context).size.width,
                    ),
                    AppTextField(
                        controller: majorSubjectTextController,
                        icon: Icon(
                          Icons.title,
                          size: 25.0,
                        ),
                        label: "",
                        hint: "Major Subject",
                        obscureText: false),
                    AppTextField(
                        controller: instituteTextController,
                        icon: Icon(
                          Icons.title,
                          size: 25.0,
                        ),
                        label: "",
                        hint: "Institute",
                        obscureText: false),
                    AppDropDownBox(
                      onChange: (value) {
                        setState(() {
                          countryInput = value;
                        });
                      },
                      list: [
                        "australia",
                        "china",
                        "india",
                        "america",
                        "indonesia"
                      ],
                      hint: "",
                      intialValue: countryInput,
                      width: MediaQuery.of(context).size.width,
                    ),
                    AppTextField(
                        controller: cityTextController,
                        icon: Icon(
                          Icons.title,
                          size: 25.0,
                        ),
                        label: "",
                        hint: "City Name",
                        obscureText: false),
                    CustomRaisedCircularButton(
                        width: 80,
                        onPressed: () {
                          print("pressed");
                          showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(2000),
                                  lastDate: DateTime.now())
                              .then((value) {
                            print(value.year);
                            setState(() {
                              qualificationEndDateTime = value;
                            });
                          });

                          print("done");
                          // print(experienceStartDateTime.year);
                        },
                        title:
                            "End : ${qualificationEndDateTime.day} / ${qualificationEndDateTime.month} / ${qualificationEndDateTime.year}"),
                    isLoading == true
                        ? Container(child: CircularProgressIndicator())
                        : CustomRaisedCircularButton(
                            onPressed: () {
                              setState(() {
                                isLoading = true;
                                addUpdateQualification();
                              });
                            },
                            title: "Update"),
                    CustomRaisedCircularButton(
                        color: Colors.grey,
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        title: "Back")
                  ],
                ),
              ),
            ]),
          ),
        )));
  }
}
