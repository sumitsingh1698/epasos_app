import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:jobportal_working/api_connection/api_connection.dart';
import 'package:jobportal_working/list_of_jobs/api_model/listJobs.dart';

part 'listofjob_event.dart';
part 'listofjob_state.dart';

class ListofjobBloc extends Bloc<ListofjobEvent, ListofjobState> {
  ListofjobBloc() : super(ListofjobLoading());

  @override
  Stream<ListofjobState> mapEventToState(
    ListofjobEvent event,
  ) async* {
    if (event is ViewListEvent) {
      yield ListofjobLoading();

      print("View List Event");

      final jobs = await JobPortalApi().getListofJobs();
      print("in event " + jobs.toString());

      ListJobs listJobs = ListJobs.fromJson(jobs);

      print(event.typeOfList);

      yield ListojjobSuccess(listJobs);
    }
  }
}
