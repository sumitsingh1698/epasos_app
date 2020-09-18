part of 'listofjob_bloc.dart';

abstract class ListofjobState extends Equatable {
  const ListofjobState();

  @override
  List<Object> get props => [];
}

class ListofjobInitial extends ListofjobState {}

class ListojjobSuccess extends ListofjobState {
  final ListJobs listJobs;
  final bool isDeletable;

  ListojjobSuccess(this.listJobs, this.isDeletable);

  @override
  List<Object> get props => [listJobs];
}

class ListojjobSuccessMessage extends ListofjobState {
  final String message;

  ListojjobSuccessMessage({this.message});

  @override
  List<Object> get props => [message];
}

class MyApplicationDeleteSuccess extends ListofjobState {}

class ListofjobLoading extends ListofjobState {}

class ListOfjobError extends ListofjobState {
  final String error;
  ListOfjobError(this.error);
  @override
  List<Object> get props => [error];
}
