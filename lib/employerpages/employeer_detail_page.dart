import 'package:epasos/utils/customRaisedCircularButton.dart';
import 'package:flutter/material.dart';

class EmployeerDetailPage extends StatefulWidget {
  final applied;
  EmployeerDetailPage({this.applied = false});

  @override
  _EmployeerDetailPageState createState() => _EmployeerDetailPageState();
}

class _EmployeerDetailPageState extends State<EmployeerDetailPage> {
  Widget companyImageBlock() {
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

  Widget companyNameBlock() {
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              widget.applied == true
                  ? CustomRaisedCircularButton(
                      onPressed: null,
                      title: "Already Applied",
                    )
                  : CustomRaisedCircularButton(
                      onPressed: () {},
                      title: "Apply Now",
                    )
            ],
          ),
          Container(
            height: 10.0,
          )
        ],
      ),
    );
  }

  Widget companyDetailBlock() {
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

  Widget jobDetailTitle() {
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
                    "Job Detail",
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

  Widget customeRowofJobBreif(String title, String data) {
    return Container(
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
        color: Colors.grey[300],
        width: 1.0,
      ))),
      padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Container(
              child: Text(
                "$title",
                style: TextStyle(fontSize: 16, color: Colors.grey[600]),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              child: Text(":"),
            ),
          ),
          Expanded(
            flex: 4,
            child: Container(
              child: Text(
                "$data",
                style: TextStyle(fontSize: 16, color: Colors.grey[600]),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget jobDetailBlock() {
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
                    "About Job",
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
              "Post for Web Development. Work is to handle our website in effecient manner.",
              style: TextStyle(color: Colors.grey[600]),
            ),
          )
        ],
      ),
    );
  }

  SliverChildListDelegate jobBriefDetail() {
    return SliverChildListDelegate(
      [
        customeRowofJobBreif("Industry", "IT - Software"),
        customeRowofJobBreif("Total Positions", "10"),
        customeRowofJobBreif("Job Type", "Full Time"),
        customeRowofJobBreif("Salary", "16000-20000"),
        customeRowofJobBreif("Job Location", "Nirman Vihar, Australia"),
        customeRowofJobBreif("Minimum Education", "BE"),
        customeRowofJobBreif("Minimum Experience", "1 Year"),
        customeRowofJobBreif("Apply By", "Dec 02, 2018"),
        customeRowofJobBreif("Job Posting Date", "Aug 02, 2018"),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text("Company Details       ")),
        ),
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: companyImageBlock(),
            ),
            SliverToBoxAdapter(
              child: companyNameBlock(),
            ),
            SliverToBoxAdapter(
              child: jobDetailBlock(),
            ),
            SliverToBoxAdapter(
              child: jobDetailTitle(),
            ),
            SliverList(
              delegate: jobBriefDetail(),
            ),
            SliverToBoxAdapter(
              child: companyDetailBlock(),
            ),
            // SliverToBoxAdapter(
            //   child: jobRequirementTitle(),
            // ),
            // SliverToBoxAdapter(
            //   child: jobRequirement(),
            // ),
          ],
        ));
  }
}
