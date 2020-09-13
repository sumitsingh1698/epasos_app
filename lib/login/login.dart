import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobportal_working/home/home_panels/headingofpages.dart';
import 'package:jobportal_working/login/bloc/login_bloc.dart';
import 'package:jobportal_working/utils/apptextfield.dart';

class LoginForm extends StatefulWidget {
  LoginForm({Key key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _onLoginButtonPressed() {
      BlocProvider.of<LoginBloc>(context).add(
        LoginButtonPressed(
          email: _emailTextController.text,
          pass: _passwordTextController.text,
        ),
      );
    }

    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginFaliure) {
          Scaffold.of(context).showSnackBar(SnackBar(
            content: Text('${state.error}'),
            backgroundColor: Colors.red,
          ));
        }
      },
      child: BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
        return buildBackground(
            context,
            Container(
              child: Column(
                children: <Widget>[
                  AppTextField(
                      controller: _emailTextController,
                      icon: Icon(
                        Icons.email,
                        size: 25.0,
                      ),
                      label: "",
                      hint: "Email Address",
                      obscureText: false),

                  AppTextField(
                      controller: _passwordTextController,
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
                  state is LoginLoading
                      ? Container(
                          child: CircularProgressIndicator(),
                        )
                      : Center(
                          child: ButtonTheme(
                            minWidth: 200,
                            child: RaisedButton(
                                child: Text(
                                  "Submit",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                onPressed: state is! LoginLoading
                                    ? _onLoginButtonPressed
                                    : null,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                )),
                          ),
                        )
                ],
              ),
            ));
      }),
    );
  }

  Container buildBackground(BuildContext context, Widget loginFrom) {
    return Container(
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
                    margin:
                        EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
                    padding:
                        EdgeInsets.symmetric(horizontal: 30.0, vertical: 15.0),
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
                        loginFrom,
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
                                                    // Navigator.push(
                                                    //     context,
                                                    //     MaterialPageRoute(
                                                    //         builder:
                                                    //             (context) =>
                                                    //                 SignUp()));
                                                  },
                                                  shape: RoundedRectangleBorder(
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
                                                    // Navigator.push(
                                                    //     context,
                                                    //     MaterialPageRoute(
                                                    //         builder: (context) =>
                                                    //             SignUpEmployer()));
                                                  },
                                                  shape: RoundedRectangleBorder(
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
    );
  }
}
