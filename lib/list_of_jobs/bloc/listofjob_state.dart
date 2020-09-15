part of 'listofjob_bloc.dart';

abstract class ListofjobState extends Equatable {
  const ListofjobState();

  @override
  List<Object> get props => [];
}

class ListofjobInitial extends ListofjobState {}

class ListojjobSuccess extends ListofjobState {
  final ListJobs listJobs;

  ListojjobSuccess(this.listJobs);

  @override
  List<Object> get props => [listJobs];
}

class ListofjobLoading extends ListofjobState {}

class ListOfjobError extends ListofjobState {}
