import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobportal_working/authentication/authentication_bloc.dart';
import 'package:jobportal_working/home/bloc/home_bloc.dart';
import 'package:jobportal_working/home/home_panels/candidate_dashboard.dart';
import 'package:jobportal_working/user_repository/user_repository.dart';

import 'home_panels/home.dart';
import 'home_panels/my_drawer.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  bool isUser;
  AuthenticationState state;
  int _currentActiveBottomButton = 0;
  List<BottomNavigationBarItem> buildBottomNavBarItems() {
    return [
      BottomNavigationBarItem(
        icon: Icon(
          Icons.home,
          size: 30.0,
          color: Color(0xFF1a2236),
        ),
        activeIcon: Icon(Icons.home, color: Colors.white, size: 30.0),
        title: Text("home"),
      ),
      BottomNavigationBarItem(
          icon: GestureDetector(
              onTap: null,
              child: Icon(Icons.search, color: Color(0xFF1a2236), size: 30.0)),
          activeIcon: Icon(Icons.search, color: Colors.white, size: 30.0),
          title: Text("search")),
      BottomNavigationBarItem(
          icon: GestureDetector(
              onTap: null,
              child: Icon(Icons.add, color: Color(0xFF1a2236), size: 30.0)),
          activeIcon: Icon(Icons.add, color: Colors.white, size: 30.0),
          title: Text("explore")),
      BottomNavigationBarItem(
          icon: GestureDetector(
              child: Icon(Icons.account_circle,
                  color: Color(0xFF1a2236), size: 30.0)),
          activeIcon:
              Icon(Icons.account_circle, color: Colors.white, size: 30.0),
          title: Text("account")),
      BottomNavigationBarItem(
          icon: Icon(Icons.settings, color: Color(0xFF1a2236), size: 30.0),
          activeIcon: Icon(Icons.settings, color: Colors.white, size: 30.0),
          title: Text("setting"))
    ];
  }

  @override
  void initState() {
    state = BlocProvider.of<AuthenticationBloc>(context).state;
    isUser = RepositoryProvider.of<UserRepository>(context).isUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Are you sure?'),
            content: Text('Do you want to exit an App'),
            actions: <Widget>[
              FlatButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: Text('No'),
              ),
              FlatButton(
                onPressed: () => exit(0),
                /*Navigator.of(context).pop(true)*/
                child: Text('Yes'),
              ),
            ],
          ),
        );
      },
      child: BlocListener<AuthenticationBloc, AuthenticationState>(
        listener: (context, state) {
          if (state is AuthenticationFailedState)
            Scaffold.of(context).showSnackBar(SnackBar(
              content: Text('${state.error}'),
              backgroundColor: Colors.red,
            ));
        },
        child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
          builder: (context, state) {
            return Scaffold(
              appBar: AppBar(
                title: Center(
                    child: state is ViewDashboardState
                        ? Text("Dashboard       ")
                        : Text("Home")),
                actions: [
                  state is ViewDashboardState
                      ? Container()
                      : IconButton(icon: Icon(Icons.search), onPressed: () {})
                ],
              ),
              drawer: Container(
                width: 250,
                color: Colors.grey[500],
                child: MyDrawer(),
              ),
              body: BlocBuilder<AuthenticationBloc, AuthenticationState>(
                builder: (context, state) {
                  if (state is ViewDashboardState) {
                    return CandidateDashboard(state.dashboardModel);
                  }
                  return Home();
                },
              ),
              bottomNavigationBar: BottomNavigationBar(
                  onTap: (index) {
                    if (index == 4) {
                      // Navigator.push(context,
                      //     MaterialPageRoute(builder: (context) => MyAccount()));
                    } else if (index == 3) {
                      BlocProvider.of<AuthenticationBloc>(context)
                          .add(ViewDashboardEvent());
                    } else if (index == 2) {
                      // Navigator.push(context,
                      //     MaterialPageRoute(builder: (context) => MyApplications()));
                    } else {
                      BlocProvider.of<AuthenticationBloc>(context)
                          .add(ViewHomeEvent());
                    }
                  },
                  type: BottomNavigationBarType.fixed,
                  currentIndex: state is ViewDashboardState ? 3 : 0,
                  showSelectedLabels: false,
                  showUnselectedLabels: false,
                  backgroundColor: Theme.of(context).primaryColor,
                  items: buildBottomNavBarItems()),
            );
          },
        ),
      ),
    );
  }
}
