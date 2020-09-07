import 'package:epasos/homepage.dart';
import 'package:epasos/utils/appdropboxbutton.dart';
import 'package:epasos/utils/apptextfield.dart';
import 'package:epasos/utils/headingofpages.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  SignUp({Key key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
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
                            child: ButtonTheme(
                              minWidth: 200,
                              child: RaisedButton(
                                  child: Text(
                                    "Submit",
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                  onPressed: () {
                                    i++;
                                    print(i);
                                    if (i < 2) setState(() {});
                                    if (i >= 2)
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  Homepage()));
                                  },
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                  )),
                            ),
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
        AppDropDownBox(
          list: ["Male", "Female", "Transgender"],
          hint: "categories",
          width: MediaQuery.of(context).size.width,
        ),
      ]);

    if (i == 1)
      return Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppDropDownBox(
              list: ["1", "2", "3"],
              hint: "",
              width: 71.0,
            ),
            AppDropDownBox(
              list: ["Jan", "Feb", "Mar"],
              hint: "",
              width: 90.0,
            ),
            AppDropDownBox(
              list: ["2000", "2001", "2002", "2003"],
              hint: "",
              width: 100.0,
            ),
          ],
        ),
        AppDropDownBox(
          list: ["Australia", "China", "India", "America"],
          hint: "",
          width: MediaQuery.of(context).size.width,
        ),
        AppTextField(
            icon: Icon(
              Icons.account_circle,
              size: 25.0,
            ),
            label: "",
            hint: "Nationality",
            obscureText: false),
        AppTextField(
            icon: Icon(
              Icons.location_on,
              size: 25.0,
            ),
            label: "",
            hint: "Address",
            obscureText: false),
        Center(
          child: ButtonTheme(
            minWidth: 200,
            child: RaisedButton(
                color: Colors.grey[500],
                child: Text(
                  "Upload Resume",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onPressed: () {},
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                )),
          ),
        )
      ]);
    return Container();
  }
}
