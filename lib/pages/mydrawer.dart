import 'package:epasos/employerpages/employeer_dashboard.dart';
import 'package:epasos/employerpages/employer_manage_job.dart';
import 'package:epasos/employerpages/employer_viewall_applications.dart';
import 'package:epasos/pages/candidate_dashboard.dart';
import 'package:epasos/pages/job_match.dart';
import 'package:epasos/pages/manage_skills.dart';
import 'package:epasos/pages/my_applications.dart';
import 'package:epasos/pages/signin.dart';
import 'package:flutter/material.dart';

import 'change_password.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Center(
            child: UserAccountsDrawerHeader(
                accountName: Text('Rishab Jain'),
                accountEmail: Text('rishabjain@gmail.com'),
                currentAccountPicture: Icon(
                  Icons.account_circle,
                  color: Colors.white,
                  size: 80.0,
                )),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => SignIn()));
            },
            child: Card(
              child: ListTile(
                leading: Icon(Icons.account_circle),
                title: Text(
                  'Sign In',
                  style: TextStyle(color: Theme.of(context).primaryColor),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CandidateDashboard()));
            },
            child: Card(
              child: ListTile(
                leading: Icon(Icons.dashboard),
                title: Text(
                  'Candidate Dashboard',
                  style: TextStyle(color: Theme.of(context).primaryColor),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MyApplications()));
            },
            child: Card(
              child: ListTile(
                leading: Icon(Icons.apps),
                title: Text(
                  'My Application',
                  style: TextStyle(color: Theme.of(context).primaryColor),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => JobMatch()));
            },
            child: Card(
              child: ListTile(
                leading: Icon(Icons.list),
                title: Text(
                  'Job Matching',
                  style: TextStyle(color: Theme.of(context).primaryColor),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ManageSkills()));
            },
            child: Card(
              child: ListTile(
                leading: Icon(Icons.add_box),
                title: Text(
                  'Manage Skills',
                  style: TextStyle(color: Theme.of(context).primaryColor),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => EmployeerDashboard()));
            },
            child: Card(
              child: ListTile(
                leading: Icon(Icons.dashboard),
                title: Text(
                  'Employee Dashboard',
                  style: TextStyle(color: Theme.of(context).primaryColor),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => EmployeerDashboard()));
            },
            child: Card(
              child: ListTile(
                leading: Icon(Icons.apps),
                title: Text(
                  'Application Recieved',
                  style: TextStyle(color: Theme.of(context).primaryColor),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => EmployerManageJob()));
            },
            child: Card(
              child: ListTile(
                leading: Icon(Icons.apps),
                title: Text(
                  'Current Jobs',
                  style: TextStyle(color: Theme.of(context).primaryColor),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ChangePassword()));
            },
            child: Card(
              child: ListTile(
                leading: Icon(Icons.dashboard),
                title: Text(
                  'Change Password',
                  style: TextStyle(color: Theme.of(context).primaryColor),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
