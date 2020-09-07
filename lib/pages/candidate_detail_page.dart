import 'package:epasos/pages/myaccount.dart';
import 'package:epasos/utils/appdropboxbutton.dart';
import 'package:epasos/utils/apptextfield.dart';
import 'package:epasos/utils/customRaisedCircularButton.dart';
import 'package:epasos/utils/mycustomDialogBox.dart';
import 'package:flutter/material.dart';

class CandidateDetailPage extends StatefulWidget {
  @override
  _CandidateDetailPageState createState() => _CandidateDetailPageState();
}

class _CandidateDetailPageState extends State<CandidateDetailPage> {
  Widget topImageBlock() {
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

  Widget nameBlock() {
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomRaisedCircularButton(
                onPressed: () {},
                title: "Accept Now",
              )
            ],
          ),
          SizedBox(
            height: 10.0,
          ),
        ],
      ),
    );
  }

  Widget professionalSummary() {
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

  Widget jobAppliedDetails() {
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
                    "Job Applied Details",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            color: Colors.grey[300],
            width: double.infinity,
            height: 40,
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
            child: Text(
              "I am working in java for 5 year. I have good grip on data structure. I viewed your profile. I love to join.",
              style: TextStyle(color: Colors.grey[600]),
            ),
          )
        ],
      ),
    );
  }

  Widget experinceTitleBlock() {
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

  SliverChildBuilderDelegate experinceDetailBlock() {
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
            ],
          ),
        );
      },
      // Or, uncomment the following line:
      childCount: 2,
    );
  }

  Widget educationTitleBlock() {
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

  SliverChildBuilderDelegate educationDetailBlock() {
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
            ],
          ),
        );
      },
      // Or, uncomment the following line:
      childCount: 1,
    );
  }

  Widget additionTitleInfo() {
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
                    " Additional Information",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
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

  SliverChildBuilderDelegate additionalDetailBlock() {
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
        appBar: AppBar(
          title: Center(child: Text("Profile Details      ")),
        ),
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: topImageBlock(),
            ),
            SliverToBoxAdapter(
              child: nameBlock(),
            ),
            SliverToBoxAdapter(
              child: jobAppliedDetails(),
            ),
            SliverToBoxAdapter(
              child: professionalSummary(),
            ),
            SliverToBoxAdapter(
              child: experinceTitleBlock(),
            ),
            SliverList(
              delegate: experinceDetailBlock(),
            ),
            SliverToBoxAdapter(
              child: educationTitleBlock(),
            ),
            SliverList(
              delegate: educationDetailBlock(),
            ),
            SliverToBoxAdapter(
              child: additionTitleInfo(),
            ),
            SliverList(
              delegate: additionalDetailBlock(),
            ),
          ],
        ));
  }
}
