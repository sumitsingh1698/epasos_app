import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobportal_working/authentication/authentication_bloc.dart';
import 'package:jobportal_working/manageskill/bloc/manageskill_bloc.dart';
import 'package:jobportal_working/user_repository/user_repository.dart';
import 'package:jobportal_working/utils/apptextfield.dart';
import 'package:jobportal_working/utils/customRaisedCircularButton.dart';
import 'package:jobportal_working/utils/mycustomDialogBox.dart';

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
                if (state is ManageskillLoadingState) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }

                if (state is ListofSkillState)
                  return ListView.builder(
                      itemCount: state.skills.data.length + 1,
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

                                      BlocProvider.of<ManageskillBloc>(context)
                                          .add(ManageskillViewList());
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
                                "${state.skills.data[index - 1].skillName[0].toUpperCase()}",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            title: Text(
                              "${state.skills.data[index - 1].skillName}",
                            ),
                            trailing: IconButton(
                              onPressed: () {
                                MyCustomDialog.showMe(
                                    context: context,
                                    title: "Warning !!!",
                                    widgets: Container(
                                      padding: EdgeInsets.all(30.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            "Are you sure for want to Delete your Skill ?? ",
                                            style: TextStyle(
                                                fontSize: 17,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            " ${state.skills.data[index - 1].skillName} ",
                                            style: TextStyle(
                                                fontSize: 17,
                                                color: Colors.red,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ),
                                    onSubmit: () {
                                      BlocProvider.of<ManageskillBloc>(context)
                                          .add(DeleteSkillEvent(
                                              state.skills.data[index - 1].iD));
                                      BlocProvider.of<ManageskillBloc>(context)
                                          .add(ManageskillViewList());
                                      Navigator.pop(context);
                                    });
                              },
                              icon: Icon(Icons.cancel),
                            ),
                          ),
                        );
                      });
                return Container();
              }),
            )),
          ),
        ));
  }
}
