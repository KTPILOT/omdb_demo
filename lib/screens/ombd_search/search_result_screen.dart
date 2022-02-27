import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:omdb_demo/bloc/result_bloc/result_bloc.dart';
import 'package:omdb_demo/bloc/search/search_bloc.dart';
import 'package:omdb_demo/screens/ombd_search/search_result_info_page.dart';
import 'package:omdb_demo/utils/scaffold_extension.dart';
import 'package:omdb_demo/utils/string_resources.dart';

class ResultScreen extends StatelessWidget {
  ResultScreen({Key? key, required this.title}) : super(key: key);
  String title;
  int page = 1;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        if (state is SearchSuccess) {
          return Column(
            children: [
              Expanded(
                  flex: 5,
                  child: ListView.separated(
                      itemBuilder: (context, index) => InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => BlocProvider(
                                      create: (context) => ResultBloc()
                                        ..add(ResultID(state
                                            .searchModel.search![index].imdbId
                                            .toString())),
                                      child: ResultDescription(
                                          imdbId: state
                                              .searchModel.search![index].imdbId
                                              .toString()),
                                    ),
                                  ));
                            },
                            child: ListTile(
                              title: Text(state.searchModel.search![index].title
                                  .toString()),
                              trailing: ClipRRect(
                                clipBehavior: Clip.hardEdge,
                                borderRadius: BorderRadius.circular(5),
                                child: state.searchModel.search![index].poster
                                            .toString() ==
                                        'N/A'
                                    ? const Text("No poster available")
                                    : Image.network(
                                        state.searchModel.search![index].poster
                                            .toString(),
                                        height: 100,
                                        width: 70,
                                        fit: BoxFit.cover,
                                      ),
                              ),
                            ),
                          ),
                      separatorBuilder: (context, index) => const SizedBox(
                            height: 10,
                          ),
                      itemCount: state.searchModel.search!.length)),
              Row(
                children: [
                  const SizedBox(width: 20),
                  const Text('Pages :'),
                  const Spacer(),
                  IconButton(
                      onPressed: () {
                        if (page == 1) {
                          return;
                        }
                        page--;
                        context.read<SearchBloc>().add(SearchData(title, page));
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.black,
                      )),
                  Text(page.toString()),
                  IconButton(
                      onPressed: () {
                        page++;
                        if (page >
                            (num.parse(state.searchModel.totalResults
                                        .toString()) /
                                    10) +
                                1) {
                          return;
                        }
                        context.read<SearchBloc>().add(SearchData(title, page));
                      },
                      icon: const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black,
                      )),
                ],
              )
            ],
          );
        }
        if (state is SearchFailure) {
          return Center(
            child: Text(state.message),
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
