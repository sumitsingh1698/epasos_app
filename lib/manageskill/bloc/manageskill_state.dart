part of 'manageskill_bloc.dart';

abstract class ManageskillState extends Equatable {
  const ManageskillState();

  @override
  List<Object> get props => [];
}

class ManageskillLoadingState extends ManageskillState {}

class ManageskillFailedState extends ManageskillState {
  final String error;
  ManageskillFailedState(this.error);

  @override
  List<Object> get props => [error];
}

class ManageskillViewSuccessState extends ManageskillState {
  final String message;
  ManageskillViewSuccessState(this.message);

  @override
  List<Object> get props => [message];
}

class ManageskillDeletedState extends ManageskillState {}

class ManageskillAddedState extends ManageskillState {}
