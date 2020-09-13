import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobportal_working/home/home_panels/headingofpages.dart';
import 'package:jobportal_working/signup/bloc/signup_bloc.dart';
import 'package:jobportal_working/signup/model/employee_signup.dart';
import 'package:jobportal_working/utils/appdropboxbutton.dart';
import 'package:jobportal_working/utils/apptextfield.dart';
import 'package:jobportal_working/utils/mytoast.dart';

enum Block { firstBlock, secondBlock, thirdBlock }

class SignUpEmployeeForm extends StatefulWidget {
  Block block = Block.firstBlock;

  SignUpEmployeeForm({Key key}) : super(key: key);

  @override
  _SignUpEmployeeFormState createState() => _SignUpEmployeeFormState();
}

class _SignUpEmployeeFormState extends State<SignUpEmployeeForm> {
  final _fullNameTextController = TextEditingController();
  final _emailTextController = TextEditingController();
  final _phoneNoTextController = TextEditingController();
  final _companyPhoneNoTextController = TextEditingController();
  final _passwordTextController = TextEditingController();

  final _companyLocationTextController = TextEditingController();
  final _cityTextController = TextEditingController();

  final _indrustyIdTextController = TextEditingController();
  final _companyWebsiteTextController = TextEditingController();
  final _companyDescriptionTextController = TextEditingController();
  final _companyNameTextController = TextEditingController();

  String country = 'India';
  String noOfEmployees = '1 - 10';
  String pickFileLocation;
  String fileName;
  String fileExtension;

  Future<void> pickFile() async {
    FilePickerResult result = await FilePicker.platform.pickFiles();
    if (result != null) {
      PlatformFile file = result.files.first;
      print(file.name);
      print(file.path);
      print(file.size);
      print(file.extension);

      setState(() {
        pickFileLocation = file.path;
        fileName = "Logo Selected";
        fileExtension = file.extension;
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
    } else if (_companyPhoneNoTextController.text.length <= 8) {
      MyToast.showToastMeasgage("Company no. must be 8 digit");
      return false;
    } else if (_passwordTextController.text.length < 6) {
      MyToast.showToastMeasgage("Password at least 6 digit");
      return false;
    }
    return true;
  }

  bool checkSecondBlocValidation() {
    if (_indrustyIdTextController.text.length <= 0) {
      MyToast.showToastMeasgage("Indrustry Can't be empty");
      return false;
    } else if (_companyWebsiteTextController.text.length <= 0) {
      MyToast.showToastMeasgage("Company Website Can't Null");
      return false;
    } else if (_companyNameTextController.text.length <= 0) {
      MyToast.showToastMeasgage("Company Name can't be null");
      return false;
    } else if (_companyLocationTextController.text.length <= 0) {
      MyToast.showToastMeasgage("Company location can't be null");
      return false;
    }
    return true;
  }

  bool checkThirdBlocValidation() {
    if (_companyDescriptionTextController.text.length <= 0) {
      MyToast.showToastMeasgage("Company Description Can't be empty");
      return false;
    } else if (_cityTextController.text.length <= 0) {
      MyToast.showToastMeasgage("city can't be empty");
      return false;
    } else if (pickFileLocation == null || fileExtension == null) {
      MyToast.showToastMeasgage("Upload a Logo or Try different Logo");
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
                                          widget.block != Block.thirdBlock
                                              ? "Next"
                                              : "Submit",
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
                                          } else if (widget.block ==
                                                  Block.secondBlock &&
                                              checkSecondBlocValidation()) {
                                            widget.block = Block.thirdBlock;
                                            setState(() {});
                                          } else if (widget.block ==
                                                  Block.thirdBlock &&
                                              checkThirdBlocValidation()) {
                                            print("clicked");

                                            EmployeeSignUp employeeSignUp =
                                                EmployeeSignUp(
                                              fullName:
                                                  _fullNameTextController.text,
                                              email: _emailTextController.text,
                                              mobilePhone:
                                                  _phoneNoTextController.text,
                                              companyPhone:
                                                  _companyPhoneNoTextController
                                                      .text,
                                              pass:
                                                  _passwordTextController.text,
                                              indrustyId:
                                                  _indrustyIdTextController
                                                      .text,
                                              companyWebsite:
                                                  _companyWebsiteTextController
                                                      .text,
                                              companyName:
                                                  _companyNameTextController
                                                      .text,
                                              companyLocation:
                                                  _companyLocationTextController
                                                      .text,
                                              country: country,
                                              city: _cityTextController.text,
                                              noOfEmployees: noOfEmployees,
                                              companyDescription:
                                                  _companyDescriptionTextController
                                                      .text,
                                              logoExtension: fileExtension,
                                              companyLogoLocation:
                                                  pickFileLocation,
                                            );
                                            print(employeeSignUp
                                                .toJson()
                                                .toString());
                                            BlocProvider.of<SignupBloc>(context)
                                                .add(EmployeeSignupEvent(
                                                    employeeSignUp));
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
    if (widget.block == Block.firstBlock) {
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
            controller: _companyPhoneNoTextController,
            icon: Icon(
              Icons.phone,
              size: 25.0,
            ),
            label: "",
            hint: "Company Phone Number",
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
      ]);
    }

    if (widget.block == Block.secondBlock) {
      return Column(children: [
        AppTextField(
            controller: _indrustyIdTextController,
            icon: Icon(
              Icons.account_circle,
              size: 25.0,
            ),
            label: "",
            textInputType: TextInputType.number,
            hint: "indrustry Id",
            obscureText: false),
        AppTextField(
            controller: _companyWebsiteTextController,
            icon: Icon(
              Icons.account_circle,
              size: 25.0,
            ),
            label: "",
            hint: "company Website",
            obscureText: false),
        AppTextField(
            controller: _companyNameTextController,
            icon: Icon(
              Icons.account_circle,
              size: 25.0,
            ),
            label: "",
            hint: "company Name",
            obscureText: false),
        AppTextField(
            controller: _companyLocationTextController,
            icon: Icon(
              Icons.account_circle,
              size: 25.0,
            ),
            label: "",
            hint: "company Location",
            obscureText: false),
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
      ]);
    }

    if (widget.block == Block.thirdBlock)
      return Column(children: [
        AppTextField(
            controller: _cityTextController,
            icon: Icon(
              Icons.account_circle,
              size: 25.0,
            ),
            label: "",
            hint: "city",
            obscureText: false),
        AppDropDownBox(
          intialValue: noOfEmployees,
          onChange: (value) {
            setState(() {
              noOfEmployees = value;
            });
          },
          list: [
            "1 - 10",
            "11 - 50",
            "51 - 100",
            "101 - 300",
            "301 - 600",
            "601 - 1000",
            "1001 - 1500",
            "1501 - 2000",
            "More than 2000"
          ],
          hint: "",
          width: MediaQuery.of(context).size.width,
        ),
        AppTextField(
            controller: _companyDescriptionTextController,
            icon: Icon(
              Icons.edit,
              size: 25.0,
            ),
            label: "",
            maxLine: 3,
            hint: "company Description",
            obscureText: false),
        Center(
          child: ButtonTheme(
            minWidth: 200,
            child: RaisedButton(
                color: Colors.grey[500],
                child: Text(
                  fileName != null ? fileName : "Upload Logo",
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
