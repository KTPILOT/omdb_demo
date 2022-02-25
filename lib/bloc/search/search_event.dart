part of 'search_bloc.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();
}

class SearchData extends SearchEvent {
  String title;

  SearchData(this.title);

  @override
  List<Object?> get props => [];
}
