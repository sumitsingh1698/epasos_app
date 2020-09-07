import 'package:epasos/pages/home.dart';
import 'package:epasos/utils/customRaisedCircularButton.dart';
import 'package:flutter/material.dart';

class MyAccount extends StatefulWidget {
  @override
  _MyAccountState createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {
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
        title: Center(child: Text("My Account")),
        actions: [
          IconButton(
              icon: Icon(Icons.home),
              onPressed: () {
                Navigator.pop(context);
              })
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10.0),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // getTitleText("Full Nam "),
                getTextFromField("Rishab Jain", "Full Name"),

                getTextFromField("9876543210", "Phone No"),
                getTextFromField("011 20123221", "Home Phone"),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(flex: 1, child: getTitleText("Gender :")),
                    Expanded(
                      flex: 2,
                      child: Container(
                          padding: EdgeInsets.only(right: 30.0),
                          child: Row(
                            children: [
                              getDropDownButton(
                                  ['Male', 'Female', 'Semi'], "Gender"),
                            ],
                          )),
                    ),
                  ],
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(flex: 1, child: getTitleText("Date of Birth :")),
                    Expanded(
                      flex: 2,
                      child: Container(
                          padding: EdgeInsets.only(right: 30.0),
                          child: Row(
                            children: [
                              getDropDownButton(['1', '2', '3'], "DOB"),
                              getDropDownButton(['Jan', 'Feb', 'Mar'], "DOB"),
                              getDropDownButton(
                                  ["2000", "2019", "2020"], "DOB"),
                            ],
                          )),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(flex: 1, child: getTitleText("Nationality :")),
                    Expanded(
                      flex: 2,
                      child: Container(
                          padding: EdgeInsets.only(right: 30.0),
                          child: Row(
                            children: [
                              getDropDownButton(['Austraila', 'India', 'China'],
                                  "Nationality"),
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
                getTextFromField("New Delhi", "City :"),
                Container(
                  padding: EdgeInsets.all(5.0),
                  child: TextFormField(
                    initialValue:
                        "234 004 GUPTA COLONY Sangam Vihar Kalkaji South East Delhi India 110080",
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: ("Address :"),
                    ),
                    maxLines: 2,
                  ),
                ),
                SizedBox(
                  height: 5.0,
                ),
                Center(
                    child: CustomRaisedCircularButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Home()));
                        },
                        title: "Update"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
