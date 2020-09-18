import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobportal_working/authentication/authentication_bloc.dart';
import 'package:jobportal_working/home/model/dashboard_model.dart';
import 'package:jobportal_working/signup/model/jobseeker_signup.dart';
import 'package:jobportal_working/user_repository/user_repository.dart';
import 'package:jobportal_working/utils/customRaisedCircularButton.dart';
import 'package:jobportal_working/utils/mytoast.dart';

class UpdateAdditionalInfoPage extends StatefulWidget {
  final UserRepository userRepository;
  final RowAdditional additionalInfo;

  UpdateAdditionalInfoPage(this.userRepository, {this.additionalInfo});
  @override
  _UpdateAdditionalInfoPageState createState() =>
      _UpdateAdditionalInfoPageState();
}

class _UpdateAdditionalInfoPageState extends State<UpdateAdditionalInfoPage> {
  bool isLoading = false;

  final languages = TextEditingController();
  final interest = TextEditingController();
  final awards = TextEditingController();
  final additionalQualities = TextEditingController();
  final convictedCrime = TextEditingController();
  final crimeDetails = TextEditingController();
  final summary = TextEditingController();
  final badHabits = TextEditingController();
  final salary = TextEditingController();
  final keywords = TextEditingController();
  final description = TextEditingController();

  String getText(String text) {
    if (text == null) return '';
    return text;
  }

  void updateField() {
    languages.text = getText(widget.additionalInfo.languages);
    interest.text = getText(widget.additionalInfo.interest);
    awards.text = getText(widget.additionalInfo.awards);
    additionalQualities.text =
        getText(widget.additionalInfo.additionalQualities);
    convictedCrime.text = getText(widget.additionalInfo.convictedCrime);
    crimeDetails.text = getText(widget.additionalInfo.crimeDetails);
    summary.text = getText(widget.additionalInfo.summary);
    badHabits.text = getText(widget.additionalInfo.badHabits);
    salary.text = getText(widget.additionalInfo.salary);
    keywords.text = getText(widget.additionalInfo.keywords);
    description.text = getText(widget.additionalInfo.description);
  }

  @override
  void initState() {
    super.initState();
    updateField();
  }

  Widget getTitleText(String text) {
    return Container(
      padding: EdgeInsets.all(5.0),
      child: Text(
        "$text",
        style: TextStyle(fontSize: 18),
      ),
    );
  }

  Widget getTextFromField(String title, TextEditingController controller) {
    return Container(
      padding: EdgeInsets.all(5.0),
      child: TextField(
          controller: controller,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: ("$title"),
          )),
    );
  }

  Widget getDropDownButton(
      List<String> items, String hint, String intail, Function onChange) {
    return Container(
        padding: EdgeInsets.all(5.0),
        child: DropdownButton<String>(
          hint: Text(hint),
          value: intail,
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
          onChanged: onChange,
          items: items.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ));
  }

  Future<void> onPressedUpdateButton() async {
    RowAdditional rowAdditional = RowAdditional(
      languages: languages.text,
      interest: interest.text,
      awards: awards.text,
      additionalQualities: additionalQualities.text,
      convictedCrime: convictedCrime.text,
      crimeDetails: crimeDetails.text,
      summary: summary.text,
      badHabits: badHabits.text,
      salary: salary.text,
      keywords: keywords.text,
      description: description.text,
    );

    try {
      await widget.userRepository.updateAdditionalInfo(rowAdditional);

      BlocProvider.of<AuthenticationBloc>(context).add(ViewDashboardEvent());
      MyToast.showToastMeasgage("Updated Successfully", color: Colors.green);
      Navigator.pop(context);
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      MyToast.showToastMeasgage("$e", color: Colors.red);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Update Additional Info")),
        actions: [
          IconButton(
              icon: Icon(Icons.home),
              onPressed: () {
                Navigator.pop(context);
              })
        ],
      ),
      body: isLoading == true
          ? Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            )
          : SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(10.0),
                child: Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // getTitleText("Full Nam "),
                      getTextFromField("Languages", languages),

                      getTextFromField("Interests", interest),
                      getTextFromField("Award", awards),
                      getTextFromField(
                          "Additional Quality", additionalQualities),
                      getTextFromField("Convicted Crime ", convictedCrime),
                      getTextFromField("Crime Detail", crimeDetails),
                      getTextFromField("Bad Habbits", badHabits),
                      getTextFromField("Summary", summary),
                      getTextFromField("Salary", salary),
                      getTextFromField("Keywords", keywords),
                      getTextFromField("description", description),

                      isLoading == true
                          ? Center(child: CircularProgressIndicator())
                          : Center(
                              child: CustomRaisedCircularButton(
                                  onPressed: () {
                                    setState(() {
                                      isLoading = true;
                                    });
                                    onPressedUpdateButton();
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
