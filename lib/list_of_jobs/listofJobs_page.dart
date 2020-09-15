import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobportal_working/authentication/authentication_bloc.dart';
import 'package:jobportal_working/list_of_jobs/listofJobs_listview.dart';

import 'bloc/listofjob_bloc.dart';

class ListOfJobsPage extends StatelessWidget {
  final String typeOfList;
  ListOfJobsPage(this.typeOfList);
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        BlocProvider.of<AuthenticationBloc>(context).add(BackToHomeEvent());
        return;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Center(child: Text("All Jobs")),
          actions: [IconButton(icon: Icon(Icons.search), onPressed: () {})],
        ),
        body: BlocProvider(
            create: (context) =>
                ListofjobBloc()..add(ViewListEvent("listofjobs")),
            child: BlocListener<ListofjobBloc, ListofjobState>(
                listener: (context, state) {
              print("states of list : $state");
            }, child: BlocBuilder<ListofjobBloc, ListofjobState>(
              builder: (context, state) {
                if (state is ListofjobLoading) {
                  return Center(
                    child: Container(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }

                if (state is ListojjobSuccess) {
                  print("done ");
                  return ListOfJobListView(state.listJobs);
                }
                return Container();
              },
            ))
            //
            ),
      ),
    );
  }
}
