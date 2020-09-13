import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobportal_working/authentication/authentication_bloc.dart';
import 'package:jobportal_working/home/home_panels/signup_dialog_widget.dart';
import 'package:jobportal_working/model/user_model.dart';
import 'package:jobportal_working/user_repository/user_repository.dart';

class MyDrawer extends StatelessWidget {
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
            MyDrawerTile(Icon(Icons.list), () {}, "Job Matching"),
            MyDrawerTile(Icon(Icons.add), () {}, "Manage Skills"),
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
