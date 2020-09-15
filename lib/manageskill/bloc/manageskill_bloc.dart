import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
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
      yield ManageskillViewSuccessState("Your all skills");
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
  }
}
