import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobportal_working/authentication/authentication_bloc.dart';
import 'package:jobportal_working/change_password/change_password.dart';
import 'package:jobportal_working/home/home_panels/signup_dialog_widget.dart';
import 'package:jobportal_working/model/user_model.dart';
import 'package:jobportal_working/update_profile/update_profile_page.dart';
import 'package:jobportal_working/user_repository/user_repository.dart';
import 'package:jobportal_working/utils/appdropboxbutton.dart';
import 'package:jobportal_working/utils/apptextfield.dart';
import 'package:jobportal_working/utils/customRaisedCircularButton.dart';
import 'package:jobportal_working/utils/mycustomDialogBox.dart';
import 'package:jobportal_working/utils/mytoast.dart';

class MyDrawer extends StatefulWidget {
  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  UserRepository userRepository;
  bool isLoading = false;

  final summaryTextController = TextEditingController();
  final jobTitleTextController = TextEditingController();
  final cityNameTextController = TextEditingController();
  final companyNameTextController = TextEditingController();

  DateTime experienceStartDateTime = DateTime.now();
  StreamController<String> controller = StreamController<String>.broadcast();

  String countryInput = "India";

  @override
  void initState() {
    userRepository = RepositoryProvider.of<UserRepository>(context);
    super.initState();
  }

  Future<void> updateSummary() async {
    isLoading = true;

    try {
      await userRepository.updateSummary(
        summaryTextController.text,
      );
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

  Future<void> addUpdateExperience() async {
    isLoading = true;

    try {
      await userRepository.addUpdateExperience(
          jobTitleTextController.text,
          companyNameTextController.text,
          countryInput,
          cityNameTextController.text,
          "${experienceStartDateTime.day}-${experienceStartDateTime.month}-${experienceStartDateTime.year}",
          "present",
          null);
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

  Widget getExperenceDialogWidget() {
    return Container(
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
          CustomRaisedCircularButton(
              onPressed: () {
                print("pressed");
                showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime.now())
                    .then((value) {
                  print(value.year);
                  experienceStartDateTime = value;
                  controller.add(
                      "Start Date : ${experienceStartDateTime.day} / ${experienceStartDateTime.month} / ${experienceStartDateTime.year}");
                });

                print("done");
                // print(experienceStartDateTime.year);
              },
              title: "Change Date"),
          StreamBuilder(
              stream: controller.stream,
              builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                return Text(snapshot.hasData
                    ? snapshot.data
                    : "Start Date : ${experienceStartDateTime.day} / ${experienceStartDateTime.month} / ${experienceStartDateTime.year}");
              }),
        ],
      ),
    );
  }

  Widget guestDrawer(BuildContext context) => Drawer(
        child: ListView(
          children: <Widget>[
            Center(
              child: UserAccountsDrawerHeader(
                  accountName: Text('Guest'),
                  accountEmail: Text('view as a Guest'),
                  currentAccountPicture: Icon(
                    Icons.account_circle,
                    color: Colors.white,
                    size: 80.0,
                  )),
            ),
            MyDrawerTile(Icon(Icons.account_circle), () {
              BlocProvider.of<AuthenticationBloc>(context)
                  .add(GoForLoggedInEvent());
            }, "Sign In"),
            MyDrawerTile(Icon(Icons.add), () {
              showSignupDialog(context, () {
                BlocProvider.of<AuthenticationBloc>(context)
                    .add(GoForSignUpEvent("employee"));
                Navigator.of(context).pop();
              }, () {
                BlocProvider.of<AuthenticationBloc>(context)
                    .add(GoForSignUpEvent("jobseeker"));
                Navigator.of(context).pop();
              });
            }, "Sign Up"),
          ],
        ),
      );

  Widget getEmployeeDrawer(BuildContext context, User user) => Drawer(
        child: ListView(
          children: <Widget>[
            Center(
              child: UserAccountsDrawerHeader(
                  accountName: Text('${user.firstName}'),
                  accountEmail: Text('${user.userEmail}'),
                  currentAccountPicture: Icon(
                    Icons.account_circle,
                    color: Colors.white,
                    size: 80.0,
                  )),
            ),
            MyDrawerTile(Icon(Icons.account_circle), () {}, "Dashboard"),
            MyDrawerTile(Icon(Icons.apps), () {}, "Application Recieved"),
            MyDrawerTile(Icon(Icons.list), () {}, "Current Jobs"),
            MyDrawerTile(Icon(Icons.add), () {
              BlocProvider.of<AuthenticationBloc>(context).add(LoggedOut());
            }, "Logout"),
          ],
        ),
      );

  Widget getJobSeekerDrawer(BuildContext context, User user) => Drawer(
        child: ListView(
          children: <Widget>[
            Center(
              child: UserAccountsDrawerHeader(
                  accountName: Text('${user.firstName}'),
                  accountEmail: Text('${user.userEmail}'),
                  currentAccountPicture: Icon(
                    Icons.account_circle,
                    color: Colors.white,
                    size: 80.0,
                  )),
            ),
            MyDrawerTile(Icon(Icons.account_circle), () {}, "Dashboard"),
            MyDrawerTile(Icon(Icons.apps), () {}, "My Application"),
            MyDrawerTile(Icon(Icons.list), () {
              BlocProvider.of<AuthenticationBloc>(context)
                  .add(GoForListofJobEvent("listofjobs"));
            }, "List of jobs"),
            MyDrawerTile(Icon(Icons.add), () {
              BlocProvider.of<AuthenticationBloc>(context)
                  .add(GoToManageEvent());
            }, "Manage Skills"),
            MyDrawerTile(Icon(Icons.add), () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => UpdateProfilePage(
                          RepositoryProvider.of<UserRepository>(context))));
            }, "Update Profile"),
            MyDrawerTile(Icon(Icons.add), () {
              isLoading == true
                  ? Container(
                      child: Center(
                      child: CircularProgressIndicator(),
                    ))
                  : MyCustomDialog.showMe(
                      context: context,
                      title: "Professional Summary",
                      widgets: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10.0),
                        child: TextField(
                          controller: summaryTextController,
                          minLines: 5,
                          maxLines: 5,
                        ),
                      ),
                      onSubmit: updateSummary);
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //         builder: (context) => EditSummaryPage("inital value", 1,
              //             RepositoryProvider.of<UserRepository>(context))));
            }, "Update Summary"),
            MyDrawerTile(Icon(Icons.add), () {
              isLoading == true
                  ? Container(
                      child: Center(
                      child: CircularProgressIndicator(),
                    ))
                  : MyCustomDialog.showMe(
                      context: context,
                      title: "Experience",
                      widgets: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10.0),
                        child: getExperenceDialogWidget(),
                      ),
                      onSubmit: () {
                        addUpdateExperience();
                      });
            }, "Add Experience"),
            MyDrawerTile(Icon(Icons.add), () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ChangePassword(
                          RepositoryProvider.of<UserRepository>(context))));
            }, "Change Password"),
            MyDrawerTile(Icon(Icons.add), () {
              BlocProvider.of<AuthenticationBloc>(context).add(LoggedOut());
            }, "Logout"),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (context, state) {
        User user = RepositoryProvider.of<UserRepository>(context).user;
        return Drawer(
          child: user == null
              ? guestDrawer(context)
              : (user.isJobSeeker == true
                  ? getJobSeekerDrawer(context, user)
                  : getEmployeeDrawer(context, user)),
        );
      },
    );
  }
}

class MyDrawerTile extends StatelessWidget {
  final Function onTap;
  final Icon icon;
  final String title;

  MyDrawerTile(this.icon, this.onTap, this.title);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        child: ListTile(
          leading: icon,
          title: Text(
            title,
            style: TextStyle(color: Theme.of(context).primaryColor),
          ),
        ),
      ),
    );
  }
}
