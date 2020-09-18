import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:jobportal_working/api_connection/api_connection.dart';
import 'package:jobportal_working/list_of_jobs/api_model/listJobs.dart';
import 'package:jobportal_working/user_repository/user_repository.dart';

part 'listofjob_event.dart';
part 'listofjob_state.dart';

class ListofjobBloc extends Bloc<ListofjobEvent, ListofjobState> {
  UserRepository userRepository;
  ListofjobBloc({@required this.userRepository}) : super(ListofjobLoading());

  @override
  Stream<ListofjobState> mapEventToState(
    ListofjobEvent event,
  ) async* {
    if (event is ViewListEvent) {
      yield ListofjobLoading();
      print(event.typeOfList);
      print("View List Event");
      try {
        var jobs;
        bool isDeletable = false;
        if (event.typeOfList == "listOfJobs")
          jobs = await JobPortalApi().getListofJobs();
        else if (event.typeOfList == "listOfMyJobs") {
          jobs = await JobPortalApi().getListOfMyJobs(userRepository.user, 1);
          isDeletable = true;
        } else if (event.typeOfList == "matchingJobs") {
          print("Matching jobs");
          jobs = await JobPortalApi().getListOfMyJobs(userRepository.user, 2);
        } else {
          jobs = await JobPortalApi().getListofJobs();
        }

        print("in event " + jobs.toString());

        ListJobs listJobs = ListJobs.fromJson(jobs);
        if (listJobs.data == null) {
          log("no Matching found");
          yield ListOfjobError("NO element Found");
          jobs = await JobPortalApi().getListofJobs();
          listJobs = ListJobs.fromJson(jobs);
        }
        print(event.typeOfList);
        yield ListojjobSuccess(listJobs, isDeletable);
      } catch (e) {
        yield ListOfjobError("$e");
      }
    } else if (event is DeleteMyApplicationEvent) {
      try {
        await JobPortalApi()
            .deleteAppliedJob(event.deleteId, userRepository.user);

        yield MyApplicationDeleteSuccess();
      } catch (e) {
        yield ListOfjobError("e");
      }
    }
  }
}
