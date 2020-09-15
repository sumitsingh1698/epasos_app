import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobportal_working/authentication/authentication_bloc.dart';
import 'package:jobportal_working/manageskill/bloc/manageskill_bloc.dart';
import 'package:jobportal_working/user_repository/user_repository.dart';
import 'package:jobportal_working/utils/apptextfield.dart';
import 'package:jobportal_working/utils/customRaisedCircularButton.dart';

class ManageSkillPage extends StatefulWidget {
  @override
  _ManageSkillPageState createState() => _ManageSkillPageState();
}

class _ManageSkillPageState extends State<ManageSkillPage> {
  final List<String> skills = ["java", "python", "javascript", "android"];
  final addSkillTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () {
          BlocProvider.of<AuthenticationBloc>(context).add(BackToHomeEvent());
          return;
        },
        child: Scaffold(
          appBar: AppBar(
            title: Center(child: Text("Add Skills")),
            actions: [
              IconButton(
                  icon: Icon(Icons.home),
                  onPressed: () {
                    BlocProvider.of<AuthenticationBloc>(context)
                        .add(BackToHomeEvent());
                  })
            ],
          ),
          body: BlocProvider(
            create: (context) =>
                ManageskillBloc(RepositoryProvider.of<UserRepository>(context))
                  ..add(ManageskillViewList()),
            child: Container(
                child: BlocListener<ManageskillBloc, ManageskillState>(
              listener: (context, state) {
                print("state are ");
                if (state is ManageskillViewSuccessState) {
                  Scaffold.of(context).showSnackBar(SnackBar(
                    content: Text('${state.message}'),
                    backgroundColor: Colors.green,
                  ));
                }
                if (state is ManageskillFailedState) {
                  Scaffold.of(context).showSnackBar(SnackBar(
                    content: Text('${state.error}'),
                    backgroundColor: Colors.red,
                  ));
                }
              },
              child: BlocBuilder<ManageskillBloc, ManageskillState>(
                  builder: (context, state) {
                return ListView.builder(
                    itemCount: skills.length,
                    itemBuilder: (context, index) {
                      if (index == 0) {
                        return Card(
                            child: ListTile(
                          // title: getTextFromField("", "Skill"),
                          title: AppTextField(
                              controller: addSkillTextController,
                              icon: Icon(Icons.update),
                              label: "Skill",
                              hint: "  java",
                              obscureText: false),

                          trailing: state is ManageskillLoadingState
                              ? CircularProgressIndicator()
                              : CustomRaisedCircularButton(
                                  onPressed: () {
                                    BlocProvider.of<ManageskillBloc>(context)
                                        .add(AddSkillEvent(
                                            addSkillTextController.text));
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
                    });
              }),
            )),
          ),
        ));
  }
}
