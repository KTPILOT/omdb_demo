import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:omdb_demo/bloc/result_bloc/result_bloc.dart';
import 'package:omdb_demo/utils/scaffold_extension.dart';

class ResultDescription extends StatefulWidget {
  const ResultDescription({Key? key, required this.imdbId}) : super(key: key);
  final String imdbId;

  @override
  _ResultDescriptionState createState() => _ResultDescriptionState();
}

class _ResultDescriptionState extends State<ResultDescription> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ResultBloc, ResultState>(
      builder: (context, state) {
        if (state is ResultSuccess) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.3,
                width: MediaQuery.of(context).size.width,
                child: ClipRRect(
                  clipBehavior: Clip.hardEdge,
                  child: state.model.poster.toString() == 'N/A'
                      ? const Text("No poster available")
                      : Image.network(
                          state.model.poster.toString(),
                          fit: BoxFit.cover,
                        ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.7,
                          child: Text(
                            state.model.title.toString(),
                            maxLines: 2,
                            style: const TextStyle(fontSize: 16),
                          ),
                        ),
                        const Spacer(),
                        Text(
                          state.model.runtime.toString(),
                          style: const TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Text(
                      state.model.plot.toString(),
                      style: const TextStyle(fontSize: 16, color: Colors.blue),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: Text(
                        state.model.genre.toString(),
                        maxLines: 2,
                        style: const TextStyle(fontSize: 14),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'imdb rating: ${state.model.imdbRating.toString()}',
                      style: const TextStyle(fontSize: 14),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      state.model.type.toString() == 'movie'
                          ? 'MOVIE'
                          : 'Total Seasons :${state.model.totalSeasons.toString()}',
                      style: const TextStyle(fontSize: 14),
                    )
                  ],
                ),
              ),
            ],
          ).appBarScaffold(
              context: context, title: state.model.title.toString());
        }
        if (state is ResultFailure) {
          Center(
            child: Text(state.message),
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
