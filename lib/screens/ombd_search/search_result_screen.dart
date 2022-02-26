import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:omdb_demo/bloc/search/search_bloc.dart';
import 'package:omdb_demo/utils/scaffold_extension.dart';
import 'package:omdb_demo/utils/string_resources.dart';

class ResultScreen extends StatelessWidget {
  ResultScreen({Key? key, required this.title}) : super(key: key);
  String title;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        if (state is SearchSuccess) {
          return ListView.separated(itemBuilder: (context, index) =>
              ListTile(
                title: Text(state.searchModel.search![index].title.toString()),
                trailing: Image.network(
                    state.searchModel.search![index].poster.toString(),
                ),
              ),
              separatorBuilder: (context, index) =>
              const SizedBox(
                height: 10,
              ), itemCount: state.searchModel.search!.length);
        }
        if (state is SearchFailure) {
          return Center(
            child: Text(
                state.message
            ),
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    ).appBarScaffold(
        context: context, title: '${StringRes().searchResult}$title');
  }
}
