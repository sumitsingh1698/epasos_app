import 'package:flutter/material.dart';

class Candidate {
  String name;
  String experience;
  String certification;
  String skills;

  Candidate({
    @required this.name,
    @required this.certification,
    @required this.experience,
    @required this.skills,
  });
}
