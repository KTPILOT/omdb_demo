import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:omdb_demo/model/search_model.dart';
import 'package:omdb_demo/services/api_services.dart';
import 'package:omdb_demo/utils/string_resources.dart';

part 'search_event.dart';

part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(SearchInitial()) {
    on<SearchData>(_getSearchData);
  }

  void _getSearchData(SearchData searchData, Emitter<SearchState> emit) async {
    emit(SearchLoading());

    try {
      String movieName = searchData.title;
      int pageNumber =  searchData.page;
      SearchModel searchModel;
      searchModel = await ApiServices().getSearchData(title: movieName, page: pageNumber);
      if (searchModel != null) {
        emit(SearchSuccess(searchModel));
      } else {
        emit(SearchFailure(StringRes().somethingWentWrong));
      }
    } catch (e) {
      emit(SearchFailure(e.toString()));
    }
  }
}
