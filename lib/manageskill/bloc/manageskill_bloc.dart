import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:jobportal_working/api_connection/api_connection.dart';
import 'package:jobportal_working/manageskill/model/skill_model.dart';
import 'package:jobportal_working/user_repository/user_repository.dart';

part 'manageskill_event.dart';
part 'manageskill_state.dart';

class ManageskillBloc extends Bloc<ManageskillEvent, ManageskillState> {
  UserRepository userRepository;

  ManageskillBloc(this.userRepository) : super(ManageskillLoadingState());

  @override
  Stream<ManageskillState> mapEventToState(
    ManageskillEvent event,
  ) async* {
    if (event is ManageskillViewList) {
      final jsonSkills = await JobPortalApi().listOfSkill(userRepository.user);

      print("in event " + jsonSkills.toString());

      Skill skills = Skill.fromJson(jsonSkills);
      yield ManageskillViewSuccessState("Your all skills");

      yield ListofSkillState(skills);
    }

    if (event is AddSkillEvent) {
      yield ManageskillLoadingState();
      try {
        await userRepository.addSkill(event.skill);
        yield ManageskillAddedState();
        yield ManageskillViewSuccessState("Successfully Added");
      } catch (e) {
        yield ManageskillFailedState(e.toString());
      }
    }
    if (event is DeleteSkillEvent) {
      yield ManageskillLoadingState();
      try {
        await JobPortalApi().deleteSkill(event.skill, userRepository.user);
        yield ManageskillViewSuccessState("Successfully Deleted");
      } catch (e) {
        yield ManageskillFailedState(e.toString());
      }
    }
  }
}
