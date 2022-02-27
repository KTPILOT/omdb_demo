part of 'result_bloc.dart';

abstract class ResultState extends Equatable {
  const ResultState();
}

class ResultInitial extends ResultState {
  @override
  List<Object> get props => [];
}


class ResultLoading extends ResultState {
  @override
  List<Object?> get props => [];
}

class ResultFailure extends ResultState {
  final String message;

  const ResultFailure({required this.message});

  @override
  List<Object?> get props => [];
}

class ResultSuccess extends ResultState {
  final ResultModel model;

  const ResultSuccess({required this.model});

  @override
  List<Object?> get props => [];
}
