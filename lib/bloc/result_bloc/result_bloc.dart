import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:omdb_demo/model/result_model.dart';
import 'package:omdb_demo/services/api_services.dart';

part 'result_event.dart';
part 'result_state.dart';

class ResultBloc extends Bloc<ResultEvent, ResultState> {
  ResultBloc() : super(ResultInitial()) {
    on<ResultID>(_getResult);
  }
  void _getResult(ResultID detailID, Emitter<ResultState> emit) async {
    emit(ResultLoading());
    try {
      String titlew = detailID.id;
      final modelList = await ApiServices().getResultDescription(imdbId: titlew);
      emit(ResultSuccess(model: modelList));
      if (modelList.response!.isEmpty) {
        emit(const ResultFailure(message: "No record Found"));
      }
    } catch (e) {
      emit(const ResultFailure(
          message: "Failed to fetch data. is your device online?"));
    }
  }
}
