import 'package:flutter/material.dart';
import 'package:jobportal_working/home/model/dashboard_model.dart';
import 'package:jobportal_working/user_repository/user_repository.dart';
import 'package:jobportal_working/utils/appdropboxbutton.dart';
import 'package:jobportal_working/utils/apptextfield.dart';
import 'package:jobportal_working/utils/customRaisedCircularButton.dart';
import 'package:jobportal_working/utils/mytoast.dart';

class ExperiencePage extends StatefulWidget {
  final UserRepository userRepository;
  final Experience experience;
  ExperiencePage(this.userRepository, {this.experience});

  @override
  _ExperiencePageState createState() => _ExperiencePageState();
}

class _ExperiencePageState extends State<ExperiencePage> {
  bool isLoading = false;

  final jobTitleTextController = TextEditingController();

  final cityNameTextController = TextEditingController();

  final companyNameTextController = TextEditingController();

  DateTime experienceStartDateTime = DateTime.now();
  DateTime experienceEndDateTime;

  String countryInput = "India";

  void updateFieldByData() {
    jobTitleTextController.text = widget.experience.jobTitle;
    cityNameTextController.text = widget.experience.city;
    companyNameTextController.text = widget.experience.companyName;
    experienceStartDateTime = DateTime.parse(widget.experience.startDate);
    print(widget.experience.endDate.toString());
    experienceEndDateTime = widget.experience.endDate != null
        ? DateTime.parse(widget.experience.endDate)
        : null;
  }

  @override
  initState() {
    if (widget.experience != null) {
      updateFieldByData();
    }
    super.initState();
  }

  Future<void> addUpdateExperience() async {
    isLoading = true;

    try {
      await widget.userRepository.addUpdateExperience(
          jobTitleTextController.text,
          companyNameTextController.text,
          countryInput,
          cityNameTextController.text,
          "${experienceStartDateTime.day}-${experienceStartDateTime.month}-${experienceStartDateTime.year}",
          experienceEndDateTime == null
              ? "present"
              : "${experienceEndDateTime.day}-${experienceEndDateTime.month}-${experienceEndDateTime.year}",
          widget.experience == null ? null : widget.experience.iD);
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
        title: Text("Experience"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(30.0),
            child: Column(
              children: [
                AppTextField(
                    controller: jobTitleTextController,
                    icon: Icon(
                      Icons.title,
                      size: 25.0,
                    ),
                    label: "",
                    hint: "Job Title",
                    obscureText: false),
                AppTextField(
                    controller: companyNameTextController,
                    icon: Icon(
                      Icons.title,
                      size: 25.0,
                    ),
                    label: "",
                    hint: "Company Name",
                    obscureText: false),
                AppDropDownBox(
                  intialValue: countryInput,
                  onChange: (value) {
                    setState(() {
                      countryInput = value;
                    });
                  },
                  list: ["Australia", "China", "India", "America"],
                  hint: "",
                  width: MediaQuery.of(context).size.width,
                ),
                AppTextField(
                    controller: cityNameTextController,
                    icon: Icon(
                      Icons.title,
                      size: 25.0,
                    ),
                    label: "",
                    hint: "City Name",
                    obscureText: false),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    CustomRaisedCircularButton(
                        color: Colors.grey,
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
                              experienceStartDateTime = value;
                            });
                          });

                          print("done");
                          // print(experienceStartDateTime.year);
                        },
                        title:
                            "Start : ${experienceStartDateTime.day} / ${experienceStartDateTime.month} / ${experienceStartDateTime.year}"),
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
                              experienceEndDateTime = value;
                            });
                          });

                          print("done");
                          // print(experienceStartDateTime.year);
                        },
                        title: experienceEndDateTime == null
                            ? "Present"
                            : "End : ${experienceEndDateTime.day} / ${experienceEndDateTime.month} / ${experienceEndDateTime.year}"),
                  ],
                ),
                isLoading == true
                    ? Container(child: CircularProgressIndicator())
                    : CustomRaisedCircularButton(
                        onPressed: () {
                          setState(() {
                            isLoading = true;
                            addUpdateExperience();
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
        ),
      ),
    );
  }
}
