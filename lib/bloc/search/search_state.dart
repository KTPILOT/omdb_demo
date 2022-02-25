part of 'search_bloc.dart';

abstract class SearchState extends Equatable {
  const SearchState();
}

class SearchInitial extends SearchState {
  @override
  List<Object> get props => [];
}

class SearchLoading extends SearchState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class SearchSuccess extends SearchState {
  final SearchModel searchModel;

  const SearchSuccess(this.searchModel);

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class SearchFailure extends SearchState {
  final String message;

  const SearchFailure(this.message);

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
