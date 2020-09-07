import 'package:epasos/pages/my_applications.dart';
import 'package:epasos/pages/myaccount.dart';
import 'package:epasos/pages/mydrawer.dart';
import 'package:epasos/utils/appdropboxbutton.dart';
import 'package:epasos/utils/apptextfield.dart';
import 'package:epasos/utils/customRaisedCircularButton.dart';
import 'package:epasos/utils/mycustomDialogBox.dart';
import 'package:flutter/material.dart';

class CandidateDashboard extends StatefulWidget {
  @override
  _CandidateDashboardState createState() => _CandidateDashboardState();
}

class _CandidateDashboardState extends State<CandidateDashboard> {
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
            "Rishabh Jain",
            style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 2.0,
          ),
          Text(
            "rishabhjain@gmail.com",
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
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MyAccount()));
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
                    "Professional Summary",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () {
                      MyCustomDialog.showMe(
                          context: context,
                          title: "Professional Summary",
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
                    "Experiences",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    MyCustomDialog.showMe(
                        context: context,
                        title: "Experience",
                        widgets: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 10.0),
                          child: getExperenceDialogWidget(),
                        ),
                        onSubmit: () {});
                  },
                  child: Row(
                    children: [
                      Text(
                        "Add Another",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                      IconButton(icon: Icon(Icons.add_box), onPressed: () {}),
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
                    Text(
                      "Zap",
                      style: TextStyle(
                          fontSize: 18,
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "New Delhi, India",
                      style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                    ),
                    Text(
                      "20, Jan 2013",
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
      childCount: 2,
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
                    "Education",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    MyCustomDialog.showMe(
                        context: context,
                        title: "Education",
                        widgets: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 10.0),
                          child: getEducationDialogWidget(),
                        ),
                        onSubmit: () {});
                  },
                  child: Row(
                    children: [
                      Text(
                        "Add Another",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                      IconButton(icon: Icon(Icons.add_box), onPressed: () {}),
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
                        "G B pant government College",
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
                      "B-Tech in Electronics",
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

  Widget eighthBlock() {
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
                    "My Job Applications",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MyApplications()));
                  },
                  child: Row(
                    children: [
                      Text(
                        "View All",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                      IconButton(
                          icon: Icon(Icons.edit),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MyApplications()));
                          }),
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

  SliverChildBuilderDelegate ninthBlock() {
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
              Expanded(
                flex: 6,
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Text(
                          "PHP Web Developer",
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
                        "Facebook",
                        style: TextStyle(
                            fontSize: 16,
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 4.0,
                      ),
                      Text(
                        "15, Jul 2020",
                        style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  child: IconButton(
                      icon: Icon(
                        Icons.cancel,
                        color: Colors.red,
                      ),
                      onPressed: () {}),
                ),
              )
            ],
          ),
        );
      },
      // Or, uncomment the following line:
      childCount: 1,
    );
  }

  Widget tenthBlock() {
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
                    "My Additional Information",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Row(
                    children: [
                      Text(
                        "Add / Edit",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                      IconButton(icon: Icon(Icons.add_box), onPressed: () {}),
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

  SliverChildBuilderDelegate eleventhBlock() {
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
              Expanded(
                flex: 6,
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            flex: 3,
                            child: Container(
                              child: Text(
                                "Interests",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                  // fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                              flex: 1,
                              child: Container(
                                child: Text(":"),
                              )),
                          Expanded(
                            flex: 7,
                            child: Container(
                              child: Text(
                                "Java, PHP, Flutter",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey[600],
                                  // fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Divider(
                        color: Colors.grey[600],
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 3,
                            child: Container(
                              child: Text(
                                "Career Objective",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                  // fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                              flex: 1,
                              child: Container(
                                child: Text(":"),
                              )),
                          Expanded(
                            flex: 7,
                            child: Container(
                              child: Text(
                                "I want to be a good software engineer",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey[600],
                                  // fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Divider(
                        color: Colors.grey[600],
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 3,
                            child: Container(
                              child: Text(
                                "Achievements",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                  // fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                              flex: 1,
                              child: Container(
                                child: Text(":"),
                              )),
                          Expanded(
                            flex: 7,
                            child: Container(
                              child: Text(
                                "SIH Winner 2020",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey[600],
                                  // fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
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
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.home),
              onPressed: () {
                Navigator.pop(context);
              },
            )
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
            SliverToBoxAdapter(
              child: eighthBlock(),
            ),
            SliverList(
              delegate: ninthBlock(),
            ),
            SliverToBoxAdapter(
              child: tenthBlock(),
            ),
            SliverList(
              delegate: eleventhBlock(),
            )
          ],
        ));
  }
}
