part of 'manageskill_bloc.dart';

abstract class ManageskillEvent extends Equatable {
  const ManageskillEvent();

  @override
  List<Object> get props => [];
}

class AddSkillEvent extends ManageskillEvent {
  final String skill;
  AddSkillEvent(this.skill);
  @override
  List<Object> get props => [skill];
}

class DeleteSkillEvent extends ManageskillEvent {
  final String skill;
  DeleteSkillEvent(this.skill);
  @override
  List<Object> get props => [skill];
}

class ManageskillViewList extends ManageskillEvent {}
