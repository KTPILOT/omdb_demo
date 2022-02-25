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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
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
        InkWell(
          onTap: () {
            if (formKey.currentState!.validate()) {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return BlocProvider(
                    create: (context) =>
                        SearchBloc()..add(SearchData(searchController.text)),
                    child: ResultScreen(
                      title: searchController.text,
                    ),
                  );
                },
              ));
            }
          },
          child: Container(
            width: MediaQuery.of(context).size.width * 0.35,
            color: Colors.blue,
            child: Row(
              children: const [
                Icon(Icons.search, size: 20),
                Text(
                  'Search',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ],
    ).appBarScaffold(context: context, title: StringRes().search);
  }
}
