import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobportal_working/home/home_panels/headingofpages.dart';
import 'package:jobportal_working/signup/bloc/signup_bloc.dart';
import 'package:jobportal_working/signup/model/jobseeker_signup.dart';
import 'package:jobportal_working/utils/appdropboxbutton.dart';
import 'package:jobportal_working/utils/apptextfield.dart';
import 'package:jobportal_working/utils/mytoast.dart';

enum Block { firstBlock, secondBlock, submit }

class SignUpJobSeekerForm extends StatefulWidget {
  Block block = Block.firstBlock;

  SignUpJobSeekerForm({Key key}) : super(key: key);

  @override
  _SignUpJobSeekerState createState() => _SignUpJobSeekerState();
}

class _SignUpJobSeekerState extends State<SignUpJobSeekerForm> {
  final _fullNameTextController = TextEditingController();
  final _emailTextController = TextEditingController();
  final _phoneNoTextController = TextEditingController();
  final _passwordTextController = TextEditingController();

  String gender = 'Male';
  String dobDate = '01';
  String dobMonth = '02';
  String dobYear = '2000';
  final _nationalityTextController = TextEditingController();
  final _cityTextController = TextEditingController();
  final _addressTextController = TextEditingController();
  String country = 'India';

  String pickFileLocation;
  String fileName;

  Future<void> pickFile() async {
    FilePickerResult result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );
    if (result != null) {
      PlatformFile file = result.files.first;

      print(file.path);
      print(file.size);
      setState(() {
        pickFileLocation = file.path;
        fileName = "CV Selected";
      });
    }
  }

  bool checkFirstBlocValidation() {
    if (_fullNameTextController.text.length <= 0) {
      MyToast.showToastMeasgage("Full Name Can't be empty");
      return false;
    } else if (!_emailTextController.text.contains("@")) {
      MyToast.showToastMeasgage("Enter Valid Email");
      return false;
    } else if (_phoneNoTextController.text.length != 10) {
      MyToast.showToastMeasgage("Phone no. must be 10 digit");
      return false;
    } else if (_passwordTextController.text.length < 6) {
      MyToast.showToastMeasgage("Password at least 6 digit");
      return false;
    }
    return true;
  }

  bool checkSecondBlocValidation() {
    if (_nationalityTextController.text.length <= 0) {
      MyToast.showToastMeasgage("Nationality Can't be empty");
      return false;
    } else if (_cityTextController.text.length <= 0) {
      MyToast.showToastMeasgage("city can't be empty");
      return false;
    } else if (_addressTextController.text.length <= 0) {
      MyToast.showToastMeasgage("address can't be empty");
      return false;
    } else if (pickFileLocation == null) {
      MyToast.showToastMeasgage("select you CV");
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignupBloc, SignupState>(listener: (context, state) {
      if (state is SignupFailed)
        Scaffold.of(context).showSnackBar(SnackBar(
          content: Text('${state.error}'),
          backgroundColor: Colors.red,
        ));
    }, child: BlocBuilder<SignupBloc, SignupState>(builder: (context, state) {
      return Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            colorFilter: new ColorFilter.mode(
                Colors.black.withOpacity(0.3), BlendMode.darken),
            image: AssetImage("assets/images/job.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                height: 30.0,
              ),
              SizedBox(
                  width: 100.0,
                  height: 100.0,
                  child: Image.asset("assets/images/icon.jpg")),
              SizedBox(height: 30.0),
              Column(
                children: [
                  Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20.0)),
                      margin: EdgeInsets.symmetric(
                          horizontal: 30.0, vertical: 10.0),
                      padding: EdgeInsets.symmetric(
                          horizontal: 30.0, vertical: 15.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          HeadingOfPages(text: "Sign Up"),
                          Container(
                            width: 60.0,
                            child: Divider(
                              color: Theme.of(context).primaryColor,
                              thickness: 4.0,
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          getWidgets(),
                          // AppDropDownBox(
                          //   list: ["Select Category", "Software", "Bussiness"],
                          //   hint: "categories",
                          // ),
                          Center(
                            child: state is SignupLoadingState
                                ? Container(
                                    child: CircularProgressIndicator(),
                                  )
                                : ButtonTheme(
                                    minWidth: 200,
                                    child: RaisedButton(
                                        child: Text(
                                          "Submit",
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                        onPressed: () {
                                          if (widget.block ==
                                                  Block.firstBlock &&
                                              checkFirstBlocValidation()) {
                                            widget.block = Block.secondBlock;
                                            setState(() {});
                                          }
                                          if (widget.block ==
                                                  Block.secondBlock &&
                                              checkSecondBlocValidation()) {
                                            // BlocProvider.of<SignupBloc>(context).add(
                                            //     EmployeeSignupEvent(EmployeeSignUp(
                                            //         fullName:
                                            //             "_fullNameTextController.text",
                                            //         email:
                                            //             "_emailTextController.text",
                                            //         mobileNo: "8285828488",
                                            //         phone: "8285828488",
                                            //         pass: "Hellow",
                                            //         gender: "male",
                                            //         dobDay: "1",
                                            //         dobMonth: "Jan",
                                            //         dobYear: "2000",
                                            //         city: "city",
                                            //         currentAddress:
                                            //             "_addressTextController.text",
                                            //         nationality:
                                            //             "_nationalityTextControlle .text",
                                            //         country: "country",
                                            //         cvLocation: pickFileLocation)));
                                            print("clicked");
                                            BlocProvider.of<SignupBloc>(context).add(
                                                JobSeekerSignupEvent(JobSeekerSignup(
                                                    fullName: _fullNameTextController
                                                        .text,
                                                    email:
                                                        _emailTextController
                                                            .text,
                                                    mobileNo:
                                                        _phoneNoTextController
                                                            .text,
                                                    phone: _phoneNoTextController
                                                        .text,
                                                    pass: _passwordTextController
                                                        .text,
                                                    gender: gender,
                                                    dobDay: dobDate,
                                                    dobMonth: dobMonth,
                                                    dobYear: dobYear,
                                                    city: _cityTextController
                                                        .text,
                                                    currentAddress:
                                                        _addressTextController
                                                            .text,
                                                    nationality:
                                                        _nationalityTextController
                                                            .text,
                                                    country: country,
                                                    cvLocation:
                                                        pickFileLocation)));
                                          }
                                        },
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(18.0),
                                        )),
                                  ),
                          ),
                        ],
                      ))
                ],
              ),
            ],
          ),
        ),
      );
    }));
  }

  Widget getWidgets() {
    if (widget.block == Block.firstBlock)
      return Column(children: [
        AppTextField(
            controller: _fullNameTextController,
            icon: Icon(
              Icons.account_circle,
              size: 25.0,
            ),
            label: "",
            hint: "Full Name",
            obscureText: false),
        AppTextField(
            controller: _emailTextController,
            icon: Icon(
              Icons.email,
              size: 25.0,
            ),
            label: "",
            hint: "Email",
            obscureText: false),
        AppTextField(
            controller: _phoneNoTextController,
            icon: Icon(
              Icons.phone,
              size: 25.0,
            ),
            label: "",
            hint: "Phone Number",
            obscureText: false),
        AppTextField(
            controller: _passwordTextController,
            icon: Icon(
              Icons.lock,
              size: 25.0,
            ),
            label: "",
            hint: "Password",
            obscureText: false),
        AppDropDownBox(
          onChange: (value) {
            setState(() {
              gender = value;
            });
          },
          intialValue: gender,
          list: ["Male", "Female", "Transgender"],
          hint: "categories",
          width: MediaQuery.of(context).size.width,
        ),
      ]);

    if (widget.block == Block.secondBlock)
      return Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppDropDownBox(
              onChange: (value) {
                setState(() {
                  dobDate = value;
                });
              },
              intialValue: dobDate,
              list: [
                "01",
                "02",
                "03",
                "04",
                "05",
                "06",
                "07",
                "08",
                "09",
                "10",
                "11",
                "12"
              ],
              hint: "01",
              width: 80.0,
            ),
            AppDropDownBox(
              onChange: (value) {
                setState(() {
                  dobMonth = value;
                });
              },
              intialValue: dobMonth,
              list: [
                "01",
                "02",
                "03",
                "04",
                "05",
                // "06",
                // "07",
                // "08",
                // "09",
                // "10",
                // "11",
                // "12"
              ],
              hint: "",
              width: 90.0,
            ),
            AppDropDownBox(
              onChange: (value) {
                setState(() {
                  dobYear = value;
                });
              },
              intialValue: dobYear,
              list: [
                "2000",
                "2001",
                "2002",
                "2003",
                "2004",
                "2005",
                "2006",
                "2007",
                "2008",
                "2009",
                "2010",
                "2011",
                "2012",
                "2013",
                "2014",
                "2015",
                "2016",
                "2017",
                "2018",
                "2019",
                "2020",
                "2021",
                "2022",
                "2023"
              ],
              hint: "",
              width: 100.0,
            ),
          ],
        ),
        AppDropDownBox(
          onChange: (value) {
            setState(() {
              country = value;
            });
          },
          intialValue: country,
          list: ["Australia", "China", "India", "America"],
          hint: "",
          width: MediaQuery.of(context).size.width,
        ),
        AppTextField(
            controller: _nationalityTextController,
            icon: Icon(
              Icons.account_circle,
              size: 25.0,
            ),
            label: "",
            hint: "Nationality",
            obscureText: false),
        AppTextField(
            controller: _cityTextController,
            icon: Icon(
              Icons.account_circle,
              size: 25.0,
            ),
            label: "",
            hint: "city",
            obscureText: false),
        AppTextField(
            controller: _addressTextController,
            icon: Icon(
              Icons.location_on,
              size: 25.0,
            ),
            label: "",
            hint: "Address",
            obscureText: false),
        Center(
          child: ButtonTheme(
            minWidth: 200,
            child: RaisedButton(
                color: Colors.grey[500],
                child: Text(
                  fileName != null ? fileName : "Upload Resume",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onPressed: pickFile,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                )),
          ),
        )
      ]);
    return Container();
  }
}
