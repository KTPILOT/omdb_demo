// To parse this JSON data, do
//
//     final detailModel = detailModelFromJson(jsonString);

import 'dart:convert';

ResultModel resultModelFromJson(String str) => ResultModel.fromJson(json.decode(str));

String resultModelToJson(ResultModel data) => json.encode(data.toJson());

class ResultModel {
  ResultModel({
    this.title,
    this.year,
    this.rated,
    this.released,
    this.runtime,
    this.genre,
    this.director,
    this.writer,
    this.actors,
    this.plot,
    this.language,
    this.country,
    this.awards,
    this.poster,
    this.ratings,
    this.metascore,
    this.imdbRating,
    this.imdbVotes,
    this.imdbId,
    this.type,
    this.totalSeasons,
    this.response,
  });

  String? title;
  String? year;
  String? rated;
  String? released;
  String? runtime;
  String? genre;
  String? director;
  String? writer;
  String? actors;
  String? plot;
  String? language;
  String? country;
  String? awards;
  String? poster;
  List<Rating>? ratings;
  String? metascore;
  String? imdbRating;
  String? imdbVotes;
  String? imdbId;
  String? type;
  String? totalSeasons;
  String? response;

  factory ResultModel.fromJson(Map<String, dynamic> json) => ResultModel(
    title: json["Title"],
    year: json["Year"],
    rated: json["Rated"],
    released: json["Released"],
    runtime: json["Runtime"],
    genre: json["Genre"],
    director: json["Director"],
    writer: json["Writer"],
    actors: json["Actors"],
    plot: json["Plot"],
    language: json["Language"],
    country: json["Country"],
    awards: json["Awards"],
    poster: json["Poster"],
    ratings: List<Rating>.from(json["Ratings"].map((x) => Rating.fromJson(x))),
    metascore: json["Metascore"],
    imdbRating: json["imdbRating"],
    imdbVotes: json["imdbVotes"],
    imdbId: json["imdbID"],
    type: json["Type"],
    totalSeasons: json["totalSeasons"],
    response: json["Response"],
  );

  Map<String, dynamic> toJson() => {
    "Title": title,
    "Year": year,
    "Rated": rated,
    "Released": released,
    "Runtime": runtime,
    "Genre": genre,
    "Director": director,
    "Writer": writer,
    "Actors": actors,
    "Plot": plot,
    "Language": language,
    "Country": country,
    "Awards": awards,
    "Poster": poster,
    "Ratings": List<dynamic>.from(ratings!.map((x) => x.toJson())),
    "Metascore": metascore,
    "imdbRating": imdbRating,
    "imdbVotes": imdbVotes,
    "imdbID": imdbId,
    "Type": type,
    "totalSeasons": totalSeasons,
    "Response": response,
  };
}

class Rating {
  Rating({
    this.source,
    this.value,
  });

  String? source;
  String? value;

  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
    source: json["Source"],
    value: json["Value"],
  );

  Map<String, dynamic> toJson() => {
    "Source": source,
    "Value": value,
  };
}
