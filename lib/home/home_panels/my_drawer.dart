import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobportal_working/authentication/authentication_bloc.dart';
import 'package:jobportal_working/change_password/change_password.dart';
import 'package:jobportal_working/home/home_panels/signup_dialog_widget.dart';
import 'package:jobportal_working/model/user_model.dart';
import 'package:jobportal_working/user_repository/user_repository.dart';

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
              }, null, null);
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
            MyDrawerTile(Icon(Icons.apps), () {
              BlocProvider.of<AuthenticationBloc>(context)
                  .add(GoForListofJobEvent("matchingJobs"));
            }, "Matching Jobs"),
            MyDrawerTile(Icon(Icons.list), () {
              BlocProvider.of<AuthenticationBloc>(context)
                  .add(GoForListofJobEvent("listOfJobs"));
            }, "List of jobs"),
            MyDrawerTile(Icon(Icons.add), () {
              BlocProvider.of<AuthenticationBloc>(context)
                  .add(GoToManageEvent());
            }, "Manage Skills"),
            MyDrawerTile(Icon(Icons.add), () {
              BlocProvider.of<AuthenticationBloc>(context)
                  .add(GoForListofJobEvent("listOfMyJobs"));
            }, "My Applications"),
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
