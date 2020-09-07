import 'package:epasos/homepage.dart';
import 'package:epasos/utils/appdropboxbutton.dart';
import 'package:epasos/utils/apptextfield.dart';
import 'package:epasos/utils/customRaisedCircularButton.dart';
import 'package:epasos/utils/headingofpages.dart';
import 'package:flutter/material.dart';

class SignUpEmployer extends StatefulWidget {
  SignUpEmployer({Key key}) : super(key: key);

  @override
  _SignUpEmployerState createState() => _SignUpEmployerState();
}

class _SignUpEmployerState extends State<SignUpEmployer> {
  int i = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        title: Center(child: Text("Sign Up        ")),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            colorFilter: new ColorFilter.mode(
                Colors.black.withOpacity(0.3), BlendMode.darken),
            image: AssetImage("assets/images/job.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                height: 30.0,
              ),
              SizedBox(
                  width: 100.0,
                  height: 100.0,
                  child: Image.asset("assets/images/icon.jpg")),
              SizedBox(height: 30.0),
              Column(
                children: [
                  Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20.0)),
                      margin: EdgeInsets.symmetric(
                          horizontal: 30.0, vertical: 10.0),
                      padding: EdgeInsets.symmetric(
                          horizontal: 30.0, vertical: 15.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          HeadingOfPages(text: "Sign Up"),
                          Container(
                            width: 60.0,
                            child: Divider(
                              color: Theme.of(context).primaryColor,
                              thickness: 4.0,
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          getWidgets(i),
                          // AppDropDownBox(
                          //   list: ["Select Category", "Software", "Bussiness"],
                          //   hint: "categories",
                          // ),
                          Center(
                            child: CustomRaisedCircularButton(
                                onPressed: () {
                                  i++;
                                  print(i);
                                  if (i < 3) setState(() {});
                                  if (i >= 3)
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Homepage()));
                                },
                                title: "Submit"),
                          ),
                        ],
                      ))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget getWidgets(int i) {
    if (i == 0)
      return Column(children: [
        AppTextField(
            icon: Icon(
              Icons.account_circle,
              size: 25.0,
            ),
            label: "",
            hint: "Full Name",
            obscureText: false),
        AppTextField(
            icon: Icon(
              Icons.account_circle,
              size: 25.0,
            ),
            label: "",
            hint: "Company Name",
            obscureText: false),
        AppTextField(
            icon: Icon(
              Icons.email,
              size: 25.0,
            ),
            label: "",
            hint: "Email",
            obscureText: false),
        AppTextField(
            icon: Icon(
              Icons.phone,
              size: 25.0,
            ),
            label: "",
            hint: "Phone Number",
            obscureText: false),
        AppTextField(
            icon: Icon(
              Icons.lock,
              size: 25.0,
            ),
            label: "",
            hint: "Password",
            obscureText: false),
      ]);

    if (i == 1)
      return Column(children: [
        AppDropDownBox(
          list: ["Account", "Advertising", "Banking"],
          hint: "",
          width: MediaQuery.of(context).size.width,
        ),
        AppDropDownBox(
          list: ["Private", "Government", "Semi-Government", "NGO"],
          hint: "",
          width: MediaQuery.of(context).size.width,
        ),
        AppDropDownBox(
          list: ["Australia", "China", "India", "America"],
          hint: "",
          width: MediaQuery.of(context).size.width,
        ),
        AppTextField(
            icon: Icon(
              Icons.location_city,
              size: 25.0,
            ),
            label: "",
            hint: "City",
            obscureText: false),
        AppTextField(
            icon: Icon(
              Icons.my_location,
              size: 25.0,
            ),
            label: "",
            hint: "Address",
            obscureText: false),
      ]);

    if (i == 2)
      return Column(children: [
        AppTextField(
            icon: Icon(
              Icons.location_city,
              size: 25.0,
            ),
            label: "",
            hint: "Company website",
            obscureText: false),
        AppTextField(
            icon: Icon(
              Icons.location_city,
              size: 25.0,
            ),
            label: "",
            hint: "Company Description",
            obscureText: false),
        AppDropDownBox(
          list: [
            "1 - 10",
            "11 - 50",
            "51 - 100",
            "101 - 300",
            "301 - 600",
            "601 - 1000",
            "1001 - 1500",
            "1501 - 2000",
            "More than 2000"
          ],
          hint: "",
          width: MediaQuery.of(context).size.width,
        ),
        Center(
          child: CustomRaisedCircularButton(
              color: Colors.grey[500],
              onPressed: () {},
              title: "Upload Company Logo"),
        ),
      ]);
    return Container();
  }
}
