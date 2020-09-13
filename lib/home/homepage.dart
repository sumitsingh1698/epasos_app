import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobportal_working/user_repository/user_repository.dart';

import 'home_panels/home.dart';
import 'home_panels/my_drawer.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  bool isUser;
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
      child: Scaffold(
        appBar: AppBar(
          title: Center(child: Text("Home")),
          actions: [IconButton(icon: Icon(Icons.search), onPressed: () {})],
        ),
        drawer: Container(
          width: 250,
          color: Colors.grey[500],
          child: MyDrawer(),
        ),
        body: Home(),
        bottomNavigationBar: BottomNavigationBar(
            onTap: (index) {
              if (index == 4) {
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (context) => MyAccount()));
              } else if (index == 3) {
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) => CandidateDashboard()));
              } else if (index == 2) {
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (context) => MyApplications()));
              }
            },
            type: BottomNavigationBarType.fixed,
            currentIndex: 0,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            backgroundColor: Theme.of(context).primaryColor,
            items: buildBottomNavBarItems()),
      ),
    );
  }
}
