import 'package:epasos/pages/home.dart';
import 'package:epasos/utils/apptextfield.dart';
import 'package:epasos/utils/customRaisedCircularButton.dart';
import 'package:flutter/material.dart';

class ManageSkills extends StatefulWidget {
  ManageSkills({Key key}) : super(key: key);

  @override
  _ManageSkillsState createState() => _ManageSkillsState();
}

class _ManageSkillsState extends State<ManageSkills> {
  List<String> skills = ["java", "python", "javascript", "android"];

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text("Add Skills")),
          actions: [
            IconButton(
                icon: Icon(Icons.home),
                onPressed: () {
                  Navigator.pop(context);
                })
          ],
        ),
        backgroundColor: Colors.grey[300],
        body: Center(
          child: ListView.builder(
              itemCount: skills.length,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return Card(
                      child: ListTile(
                    // title: getTextFromField("", "Skill"),
                    title: AppTextField(
                        icon: Icon(Icons.update),
                        label: "Skill",
                        hint: "  java",
                        obscureText: false),
                    trailing: CustomRaisedCircularButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Home()));
                      },
                      title: "Add +",
                      width: 100,
                    ),
                  ));
                }

                return Card(
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Theme.of(context).primaryColor,
                      child: Text(
                        "${skills[index][0].toUpperCase()}",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    title: Text(
                      "${skills[index]}",
                    ),
                    trailing: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.cancel),
                    ),
                  ),
                );
              }),
        ));
  }
}
