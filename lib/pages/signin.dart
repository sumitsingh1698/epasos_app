import 'package:epasos/pages/signup.dart';
import 'package:epasos/utils/apptextfield.dart';
import 'package:epasos/utils/headingofpages.dart';
import 'package:flutter/material.dart';

import 'signupemployer.dart';

class SignIn extends StatefulWidget {
  SignIn({Key key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        title: Center(child: Text("Sign In         ")),
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
              SizedBox(height: 50.0),
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
                          HeadingOfPages(text: "Sign In"),
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
                          AppTextField(
                              icon: Icon(
                                Icons.email,
                                size: 25.0,
                              ),
                              label: "",
                              hint: "Email Address",
                              obscureText: false),

                          AppTextField(
                              icon: Icon(
                                Icons.lock,
                                size: 25.0,
                              ),
                              label: "",
                              hint: "Password",
                              obscureText: false),
                          // AppDropDownBox(
                          //   list: ["Select Category", "Software", "Bussiness"],
                          //   hint: "categories",
                          // ),
                          FlatButton(
                            onPressed: () {},
                            child: Text("Forget Password"),
                            textColor: Theme.of(context).primaryColor,
                          ),
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
                                  onPressed: () {},
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                  )),
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "New Here ? ",
                                style: TextStyle(
                                    color: Theme.of(context).primaryColor),
                              ),
                              GestureDetector(
                                  onTap: () {
                                    showDialog(
                                        context: context,
                                        child: SimpleDialog(
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(18.0),
                                          ),
                                          children: [
                                            Center(
                                              child: ButtonTheme(
                                                minWidth: 200,
                                                child: RaisedButton(
                                                    child: Text(
                                                      "Candidate",
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                    onPressed: () {
                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder:
                                                                  (context) =>
                                                                      SignUp()));
                                                    },
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              18.0),
                                                    )),
                                              ),
                                            ),
                                            Center(
                                              child: ButtonTheme(
                                                buttonColor: Colors.grey[500],
                                                minWidth: 200,
                                                child: RaisedButton(
                                                    child: Text(
                                                      "Employer",
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                    onPressed: () {
                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                  SignUpEmployer()));
                                                    },
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              18.0),
                                                    )),
                                              ),
                                            ),
                                          ],
                                        ));
                                  },
                                  child: Text(
                                    "Signup",
                                    style: TextStyle(
                                        color: Theme.of(context).primaryColor),
                                  )),
                            ],
                          )
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
}
