part of 'search_bloc.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();
}

class SearchData extends SearchEvent {
  String title;
  int page;

  SearchData(this.title, this.page);

  @override
  List<Object?> get props => [];
}
