import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobportal_working/authentication/authentication_bloc.dart';
import 'package:jobportal_working/list_of_jobs/listofJobs_listview.dart';
import 'package:jobportal_working/user_repository/user_repository.dart';

import 'bloc/listofjob_bloc.dart';

class ListOfJobsPage extends StatelessWidget {
  final String typeOfList;
  ListOfJobsPage(this.typeOfList);

  String getAppBarTitle() {
    if (typeOfList == "listOfJobs") {
      return "All Jobs";
    } else if (typeOfList == "listOfMyJobs") {
      return "My Applications";
    } else {
      return "Jobs";
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        BlocProvider.of<AuthenticationBloc>(context).add(BackToHomeEvent());
        return;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Center(child: Text(getAppBarTitle())),
          actions: [IconButton(icon: Icon(Icons.search), onPressed: () {})],
        ),
        body: BlocProvider(
            create: (context) => ListofjobBloc(
                userRepository: RepositoryProvider.of<UserRepository>(context))
              ..add(ViewListEvent(typeOfList)),
            child: BlocListener<ListofjobBloc, ListofjobState>(
                listener: (context, state) {
              if (state is ListOfjobError) {
                Scaffold.of(context).showSnackBar(SnackBar(
                  content: Text('${state.error}'),
                  backgroundColor: Colors.red,
                ));
              }
              if (state is ListojjobSuccessMessage) {
                Scaffold.of(context).showSnackBar(SnackBar(
                  content: Text('${state.message}'),
                  backgroundColor: Colors.green,
                ));
              }

              print("states of list : $state");
            }, child: BlocBuilder<ListofjobBloc, ListofjobState>(
              builder: (context, state) {
                if (state is MyApplicationDeleteSuccess) {
                  BlocProvider.of<ListofjobBloc>(context)
                      .add(ViewListEvent("listOfMyJobs"));
                }
                if (state is ListofjobLoading) {
                  return Center(
                    child: Container(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }

                if (state is ListojjobSuccess) {
                  print("done ");

                  return ListOfJobListView(state.listJobs,
                      isDeletedAble: state.isDeletable);
                }
                return Container();
              },
            ))),
      ),
    );
  }
}
