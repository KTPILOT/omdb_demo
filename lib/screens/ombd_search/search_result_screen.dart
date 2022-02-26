import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:omdb_demo/bloc/search/search_bloc.dart';
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
                child: ListView.separated(itemBuilder: (context, index) =>
                  ListTile(
                    title: Text(state.searchModel.search![index].title.toString()),
                    trailing: Image.network(
                        state.searchModel.search![index].poster.toString(),
                    ),
                  ),
                  separatorBuilder: (context, index) =>
                  const SizedBox(
                    height: 10,
                  ), itemCount: state.searchModel.search!.length)),
              Expanded(
                flex: 1,
                child: Row(children: [
                const Text('Pages :'),
                const Spacer(),
                IconButton(onPressed: (){
                  page--;
                  if(page < 1){
                    return null;
                  }
                  context.read<SearchBloc>().add(SearchData(title, page));
                },
                 icon: const Icon(Icons.arrow_back_ios, color: Colors.black,)),
                Text(page.toString()),
                IconButton(onPressed: (){
                  page++;
                  if(page > (num.parse(state.searchModel.totalResults.toString())/10)+ 1){
                    return ;
                  }
                  context.read<SearchBloc>().add(SearchData(title, page));
                },
                 icon: const Icon(Icons.arrow_forward_ios, color: Colors.black,)),
              ],),)
            ],
          );
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
