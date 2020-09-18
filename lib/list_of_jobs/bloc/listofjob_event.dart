part of 'listofjob_bloc.dart';

abstract class ListofjobEvent extends Equatable {
  const ListofjobEvent();

  @override
  List<Object> get props => [];
}

class ViewListEvent extends ListofjobEvent {
  final String typeOfList;

  ViewListEvent(this.typeOfList);

  @override
  List<Object> get props => [typeOfList];
}

class DeleteMyApplicationEvent extends ListofjobEvent {
  final String deleteId;

  DeleteMyApplicationEvent({@required this.deleteId});
  @override
  List<Object> get props => [deleteId];
}
