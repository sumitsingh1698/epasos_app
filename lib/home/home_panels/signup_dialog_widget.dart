import 'package:flutter/material.dart';

showSignupDialog(context, onPressEmployee, onPressCandidate) => showDialog(
    context: context,
    child: SimpleDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18.0),
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
                onPressed: onPressCandidate,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
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
                onPressed: onPressEmployee,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                )),
          ),
        ),
      ],
    ));
