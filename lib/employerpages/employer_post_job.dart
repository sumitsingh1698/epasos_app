import 'package:epasos/employerpages/employeer_dashboard.dart';
import 'package:epasos/utils/customRaisedCircularButton.dart';
import 'package:flutter/material.dart';

class EmployerPostJob extends StatefulWidget {
  @override
  _EmployerPostJobState createState() => _EmployerPostJobState();
}

class _EmployerPostJobState extends State<EmployerPostJob> {
  Widget getTitleText(String text) {
    return Container(
      padding: EdgeInsets.all(5.0),
      child: Text(
        "$text",
        style: TextStyle(fontSize: 18),
      ),
    );
  }

  Widget getTextFromField(String text, String title) {
    return Container(
      padding: EdgeInsets.all(5.0),
      child: TextFormField(
          initialValue: "$text",
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: ("$title"),
          )),
    );
  }

  Widget getDropDownButton(List<String> items, String hint) {
    return Container(
        padding: EdgeInsets.all(5.0),
        child: DropdownButton<String>(
          hint: Text(hint),
          value: items[0],
          icon: Icon(Icons.arrow_downward),
          iconSize: 24,
          elevation: 16,
          style: TextStyle(
            color: Colors.black,
          ),
          underline: Container(
            height: 2,
            color: Theme.of(context).primaryColor,
          ),
          onChanged: (String newValue) {},
          items: items.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Post a Job")),
        actions: [IconButton(icon: Icon(Icons.home), onPressed: () {})],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10.0),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // getTitleText("Full Nam "),

                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //   children: [
                //     Expanded(flex: 1, child: getTitleText("Category :")),
                //     Expanded(
                //       flex: 2,
                //       child: Container(
                //           padding: EdgeInsets.only(right: 30.0),
                //           child: Row(
                //             children: [
                //               getDropDownButton(
                //                   ['Private', 'Government', 'Semi-Government'],
                //                   "select Industry"),
                //             ],
                //           )),
                //     ),
                //   ],
                // ),

                getTextFromField("", "Job Title"),
                getTextFromField("", "No. of Vacanies"),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(flex: 1, child: getTitleText("Experience :")),
                    Expanded(
                      flex: 2,
                      child: Container(
                          padding: EdgeInsets.only(right: 30.0),
                          child: Row(
                            children: [
                              getDropDownButton([
                                "Fresh",
                                "Less Than a year",
                                "1",
                                "2",
                                "3",
                                "3+"
                              ], "Job Mode"),
                            ],
                          )),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(flex: 1, child: getTitleText("Job Mode :")),
                    Expanded(
                      flex: 2,
                      child: Container(
                          padding: EdgeInsets.only(right: 30.0),
                          child: Row(
                            children: [
                              getDropDownButton(
                                  ["Full Time", "Part Time", "Home Based"],
                                  "Job Mode"),
                            ],
                          )),
                    ),
                  ],
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                        flex: 1,
                        child: getTitleText("Salary Offer\n(Pk Rs.) :")),
                    Expanded(
                      flex: 2,
                      child: Container(
                          padding: EdgeInsets.only(right: 30.0),
                          child: Row(
                            children: [
                              getDropDownButton(
                                  ["Trainee Stipend", "5k - 10k", "10k - 20k"],
                                  "Salary Offer"),
                            ],
                          )),
                    ),
                  ],
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(flex: 1, child: getTitleText("Location :")),
                    Expanded(
                      flex: 2,
                      child: Container(
                          padding: EdgeInsets.only(right: 30.0),
                          child: Row(
                            children: [
                              getDropDownButton(
                                  ['Austraila', 'India', 'China'], "Location"),
                            ],
                          )),
                    ),
                  ],
                ),
                getTextFromField("", "City :"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(flex: 1, child: getTitleText("Qualification :")),
                    Expanded(
                      flex: 2,
                      child: Container(
                          padding: EdgeInsets.only(right: 30.0),
                          child: Row(
                            children: [
                              getDropDownButton(['B-Tech', 'BBA', 'B-Sc'],
                                  "Select Qualification"),
                            ],
                          )),
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.all(5.0),
                  child: TextFormField(
                    initialValue: "",
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: ("Job Description :"),
                    ),
                    maxLines: 4,
                  ),
                ),
                Center(
                    child: CustomRaisedCircularButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => EmployeerDashboard()));
                        },
                        title: "Post"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
