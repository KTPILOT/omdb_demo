part of 'result_bloc.dart';

abstract class ResultEvent extends Equatable {
  const ResultEvent();
}

class ResultID extends ResultEvent {
  String id;

  ResultID(this.id);

  @override
  List<Object?> get props => [];
}