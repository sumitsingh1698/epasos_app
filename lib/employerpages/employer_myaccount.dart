import 'package:epasos/utils/customRaisedCircularButton.dart';
import 'package:flutter/material.dart';

class EmployerMyAccount extends StatefulWidget {
  @override
  _EmployerMyAccountState createState() => _EmployerMyAccountState();
}

class _EmployerMyAccountState extends State<EmployerMyAccount> {
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

                getTextFromField("Rishab Jain", "Your Name"),
                getTextFromField("Google", "Company Name"),

                getTextFromField("", "Cell Phone"),

                getTextFromField("011 20123221", "Landline Phone"),
                getTextFromField("https://www.google.com", "Company Website"),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(flex: 1, child: getTitleText("No. of Employee :")),
                    Expanded(
                      flex: 2,
                      child: Container(
                          padding: EdgeInsets.only(right: 30.0),
                          child: Row(
                            children: [
                              getDropDownButton([
                                "1 - 10",
                                "11 - 50",
                                "51 - 100",
                                "101 - 300",
                                "301 - 600",
                                "601 - 1000",
                                "1001 - 1500",
                                "1501 - 2000",
                                "More than 2000"
                              ], "No. of Employee"),
                            ],
                          )),
                    ),
                  ],
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(flex: 1, child: getTitleText("Industry :")),
                    Expanded(
                      flex: 2,
                      child: Container(
                          padding: EdgeInsets.only(right: 30.0),
                          child: Row(
                            children: [
                              getDropDownButton(
                                  ["Account", "Advertising", "Banking"],
                                  "Industry"),
                            ],
                          )),
                    ),
                  ],
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(flex: 1, child: getTitleText("Org. Type :")),
                    Expanded(
                      flex: 2,
                      child: Container(
                          padding: EdgeInsets.only(right: 30.0),
                          child: Row(
                            children: [
                              getDropDownButton([
                                "Private",
                                "Government",
                                "Semi-Government",
                                "NGO"
                              ], "Org. Type"),
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
                Container(
                  padding: EdgeInsets.all(5.0),
                  child: TextFormField(
                    initialValue: "My company is world largest IT company",
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: ("Company Description :"),
                    ),
                    maxLines: 2,
                  ),
                ),
                Center(
                    child: CustomRaisedCircularButton(
                        onPressed: () {}, title: "Update"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
