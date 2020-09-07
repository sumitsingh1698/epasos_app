import 'package:epasos/employerpages/employer_manage_job.dart';
import 'package:epasos/employerpages/employer_myaccount.dart';
import 'package:epasos/employerpages/employer_post_job.dart';
import 'package:epasos/employerpages/employer_viewall_applications.dart';
import 'package:epasos/pages/mydrawer.dart';
import 'package:epasos/utils/appdropboxbutton.dart';
import 'package:epasos/utils/apptextfield.dart';
import 'package:epasos/utils/customRaisedCircularButton.dart';
import 'package:epasos/utils/mycustomDialogBox.dart';
import 'package:flutter/material.dart';

class EmployeerDashboard extends StatefulWidget {
  @override
  _EmployeerDashboardState createState() => _EmployeerDashboardState();
}

class _EmployeerDashboardState extends State<EmployeerDashboard> {
  Widget firstBlock() {
    return Container(
      child: Stack(
        children: [
          Container(
            height: 120,
          ),
          Container(
            decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.elliptical(
                      MediaQuery.of(context).size.width / 2, 100),
                  bottomRight: Radius.elliptical(
                      MediaQuery.of(context).size.width / 2, 100),
                )),
            width: double.infinity,
            height: 80.0,
          ),
          Positioned(
            top: 25,
            left: MediaQuery.of(context).size.width / 2 - 45,
            height: 90,
            width: 90,
            child: CircleAvatar(
              radius: 1200.0,
              backgroundColor: Theme.of(context).primaryColor,
            ),
          ),
          Positioned(
            top: 30,
            left: MediaQuery.of(context).size.width / 2 - 40,
            height: 80,
            width: 80,
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://cdn03.boxcdn.net/sites/default/files/2018-10/icon-24.png"),
              radius: 1000.0,
              backgroundColor: Colors.white,
            ),
          )
        ],
      ),
    );
  }

  Widget secondBlock() {
    return Container(
      child: Column(
        children: [
          Text(
            "Google",
            style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 2.0,
          ),
          Text(
            "www.google.com",
            style: TextStyle(
                color: Colors.grey[500],
                fontSize: 14,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 3.0,
          ),
          Text(
            "7015346398",
            style: TextStyle(
                color: Colors.grey[500],
                fontSize: 14,
                fontWeight: FontWeight.bold),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {
                  print("click");
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => EmployerMyAccount()));
                },
                child: Container(
                  child: Row(
                    children: [
                      Text(
                        "Edit Profile",
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      Icon(Icons.edit),
                      SizedBox(
                        width: 10.0,
                      ),
                    ],
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget thirdBlock() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 18.0),
                  child: Text(
                    "About Company",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () {
                      MyCustomDialog.showMe(
                          context: context,
                          title: "About Company",
                          widgets: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 10.0),
                            child: TextFormField(
                              minLines: 5,
                              maxLines: 5,
                              initialValue:
                                  "My first job was as an administrative assistant for a realty company in Tampa. I learned a great deal in that role but wanted to move into a more customer oriented job, so I became a sales rep at Home Depot. I also volunteered at our community theatre as a mentor to the young actors",
                            ),
                          ),
                          onSubmit: () {});
                    })
              ],
            ),
            color: Colors.grey[300],
            width: double.infinity,
            height: 40,
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
            child: Text(
              "My first job was as an administrative assistant for a realty company in Tampa. I learned a great deal in that role but wanted to move into a more customer oriented job, so I became a sales rep at Home Depot. I also volunteered at our community theatre as a mentor to the young actors",
              style: TextStyle(color: Colors.grey[600]),
            ),
          )
        ],
      ),
    );
  }

  Widget getExperenceDialogWidget() {
    return Container(
      child: Column(
        children: [
          AppTextField(
              icon: Icon(
                Icons.title,
                size: 25.0,
              ),
              label: "",
              hint: "Job Title",
              obscureText: false),
          AppTextField(
              icon: Icon(
                Icons.title,
                size: 25.0,
              ),
              label: "",
              hint: "Company Name",
              obscureText: false),
          AppDropDownBox(
            list: ["Australia", "China", "India", "America"],
            hint: "",
            width: MediaQuery.of(context).size.width,
          ),
          AppTextField(
              icon: Icon(
                Icons.title,
                size: 25.0,
              ),
              label: "",
              hint: "City Name",
              obscureText: false),
          CustomRaisedCircularButton(
              onPressed: () {
                showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime.now());
              },
              title:
                  ("Start Date : ${DateTime.now().day} / ${DateTime.now().month} / ${DateTime.now().year}")),
          CustomRaisedCircularButton(
              onPressed: () {
                showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime.now());
              },
              title: ("End Date : Present "))
        ],
      ),
    );
  }

  Widget forthBlock() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 18.0),
                  child: Text(
                    "Job Applications Received",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => EmployerListOfApplication()));
                  },
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.only(right: 20.0),
                        child: Text(
                          "View All",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                      ),
                      // IconButton(icon: Icon(Icons.add_box), onPressed: () {}),
                    ],
                  ),
                )
              ],
            ),
            color: Colors.grey[300],
            width: double.infinity,
            height: 40,
          ),
        ],
      ),
    );
  }

  SliverChildBuilderDelegate fifthBlock() {
    return SliverChildBuilderDelegate(
      (BuildContext context, int index) {
        return Container(
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(
            color: Colors.grey[300],
            width: 1.0,
          ))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Software Developer",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        // fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4.0),
                    Text(
                      "Rishab jain",
                      style: TextStyle(
                          fontSize: 18,
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 4.0),
                    Text(
                      "No experince",
                      style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                    ),
                    SizedBox(height: 4.0),
                    Text(
                      "Cerification : G. B. pant college",
                      style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                    ),
                    SizedBox(height: 4.0),
                    Text(
                      "Skills : Java, Python",
                      style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  // IconButton(
                  //     icon: Icon(
                  //       Icons.edit,
                  //       color: Theme.of(context).primaryColor,
                  //     ),
                  //     onPressed: () {}),
                  IconButton(
                      icon: Icon(
                        Icons.cancel,
                        color: Colors.red,
                      ),
                      onPressed: () {}),
                ],
              )
            ],
          ),
        );
      },
      // Or, uncomment the following line:
      childCount: 1,
    );
  }

  Widget getEducationDialogWidget() {
    return Container(
      child: Column(
        children: [
          AppDropDownBox(
            list: ["BBA", "B-Tech", "B-Com", "B-Sc"],
            hint: "",
            width: MediaQuery.of(context).size.width,
          ),
          AppTextField(
              icon: Icon(
                Icons.title,
                size: 25.0,
              ),
              label: "",
              hint: "Major Subject",
              obscureText: false),
          AppTextField(
              icon: Icon(
                Icons.title,
                size: 25.0,
              ),
              label: "",
              hint: "Institute",
              obscureText: false),
          AppDropDownBox(
            list: ["Australia", "China", "India", "America"],
            hint: "",
            width: MediaQuery.of(context).size.width,
          ),
          AppTextField(
              icon: Icon(
                Icons.title,
                size: 25.0,
              ),
              label: "",
              hint: "City Name",
              obscureText: false),
          CustomRaisedCircularButton(
              onPressed: () {
                showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime.now());
              },
              title:
                  ("Completation Date : ${DateTime.now().day} / ${DateTime.now().month} / ${DateTime.now().year}")),
        ],
      ),
    );
  }

  Widget sixthBlock() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 18.0),
                  child: Text(
                    "Current Jobs in Google",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                Row(
                  children: [
                    FlatButton(
                        child: Text("Add New"),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => EmployerPostJob(),
                              ));
                          print("job pages");
                        }),
                    FlatButton(
                        child: Text("View All"),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => EmployerManageJob()));
                          print("job pages");
                        }),
                  ],
                )
              ],
            ),
            color: Colors.grey[300],
            width: double.infinity,
            height: 40,
          ),
        ],
      ),
    );
  }

  SliverChildBuilderDelegate seventhBlock() {
    return SliverChildBuilderDelegate(
      (BuildContext context, int index) {
        return Container(
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(
            color: Colors.grey[300],
            width: 1.0,
          ))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Text(
                        "Part Time",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          // fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 4.0,
                    ),
                    Text(
                      "Java Developer",
                      style: TextStyle(
                          fontSize: 16,
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 4.0,
                    ),
                    Text(
                      "Java, Python",
                      style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  IconButton(
                      icon: Icon(
                        Icons.edit,
                        color: Theme.of(context).primaryColor,
                      ),
                      onPressed: () {}),
                  IconButton(
                      icon: Icon(
                        Icons.cancel,
                        color: Colors.red,
                      ),
                      onPressed: () {}),
                ],
              )
            ],
          ),
        );
      },
      // Or, uncomment the following line:
      childCount: 1,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: MyDrawer(),
        appBar: AppBar(
          title: Center(child: Text("My Dashboard")),
          actions: [
            IconButton(
                icon: Icon(Icons.home),
                onPressed: () {
                  Navigator.pop(context);
                })
          ],
        ),
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: firstBlock(),
            ),
            SliverToBoxAdapter(
              child: secondBlock(),
            ),
            SliverToBoxAdapter(
              child: thirdBlock(),
            ),
            SliverToBoxAdapter(
              child: forthBlock(),
            ),
            SliverList(
              delegate: fifthBlock(),
            ),
            SliverToBoxAdapter(
              child: sixthBlock(),
            ),
            SliverList(
              delegate: seventhBlock(),
            ),
          ],
        ));
  }
}
