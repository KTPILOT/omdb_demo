import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:omdb_demo/bloc/search/search_bloc.dart';
import 'package:omdb_demo/screens/ombd_search/search_result_screen.dart';
import 'package:omdb_demo/utils/scaffold_extension.dart';
import 'package:omdb_demo/utils/string_resources.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController searchController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 20, end: 20),
      child:Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 150),
        Form(
          key: formKey,
          child: TextFormField(
            controller: searchController,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Type Something';
              }
            },
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
        InkWell(
          onTap: () {
            if (formKey.currentState!.validate()) {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return BlocProvider(
                    create: (context) =>
                        SearchBloc()..add(SearchData(searchController.text, 1)),
                    child: ResultScreen(
                      title: searchController.text,
                    ),
                  );
                },
              ));
            }
          },
          child: Container(
            padding: const EdgeInsetsDirectional.only(top: 5, bottom: 5),
            width: MediaQuery.of(context).size.width * 0.35,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(10)
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.search, size: 30, color: Colors.white,),
                Text(
                  'Search',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ],
    ),).appBarScaffold(context: context, title: StringRes().search);
  }
}
