import 'dart:io';

import 'package:epasos/pages/candidate_dashboard.dart';
import 'package:epasos/pages/home.dart';
import 'package:epasos/pages/my_applications.dart';
import 'package:epasos/pages/myaccount.dart';
import 'package:epasos/pages/mydrawer.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
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
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MyAccount()));
              } else if (index == 3) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CandidateDashboard()));
              } else if (index == 2) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MyApplications()));
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
