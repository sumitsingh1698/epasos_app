import 'package:flutter/material.dart';

class Job {
  String title;
  String location;
  String company;
  String jobType;
  String lastDate;
  String salary;
  String imgUrl;

  Job({
    @required this.title,
    @required this.location,
    @required this.company,
    @required this.imgUrl,
    @required this.jobType,
    @required this.lastDate,
    @required this.salary,
  });
}
