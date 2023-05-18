// To parse this JSON data, do
//
//     final movieModel = movieModelFromJson(jsonString);

// ignore_for_file: constant_identifier_names

import 'package:meta/meta.dart';
import 'dart:convert';

MovieModel movieModelFromJson(String str) => MovieModel.fromJson(json.decode(str));

String movieModelToJson(MovieModel data) => json.encode(data.toJson());

class MovieModel {
    final int page;
    final List<Result> results;
    final int totalPages;
    final int totalResults;

    MovieModel({
        required this.page,
        required this.results,
        required this.totalPages,
        required this.totalResults,
    });

    factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
        page: json["page"] ?? 0,
        results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
    );

    Map<String, dynamic> toJson() => {
        "page": page,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
        "total_pages": totalPages,
        "total_results": totalResults,
    };
}

class Result {
    final bool adult;
    final String backdropPath;
    final int id;
    final String title;
    final String originalLanguage;
    final String originalTitle;
    final String overview;
    final String posterPath;
    final MediaType mediaType;
    final List<int> genreIds;
    final double popularity;
    final DateTime releaseDate;
    final bool video;
    final double voteAverage;
    final int voteCount;
    final String name;
    final String originalName;
    final DateTime firstAirDate;
    final List<String> originCountry;

    Result({
        required this.adult,
        required this.backdropPath,
        required this.id,
        required this.title,
        required this.originalLanguage,
        required this.originalTitle,
        required this.overview,
        required this.posterPath,
        required this.mediaType,
        required this.genreIds,
        required this.popularity,
        required this.releaseDate,
        required this.video,
        required this.voteAverage,
        required this.voteCount,
        required this.name,
        required this.originalName,
        required this.firstAirDate,
        required this.originCountry,
    });

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        adult: json["adult"],
        backdropPath: json["backdrop_path"],
        id: json["id"],
        title: json["title"],
        originalLanguage: json["original_language"],
        originalTitle: json["original_title"],
        overview: json["overview"],
        posterPath: json["poster_path"],
        mediaType: mediaTypeValues.map[json["media_type"]]!,
        genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
        popularity: json["popularity"]?.toDouble(),
        releaseDate: DateTime.parse(json["release_date"]),
        video: json["video"],
        voteAverage: json["vote_average"]?.toDouble(),
        voteCount: json["vote_count"],
        name: json["name"],
        originalName: json["original_name"],
        firstAirDate: DateTime.parse(json["first_air_date"]),
        originCountry: List<String>.from(json["origin_country"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "adult": adult,
        "backdrop_path": backdropPath,
        "id": id,
        "title": title,
        "original_language": originalLanguage,
        "original_title": originalTitle,
        "overview": overview,
        "poster_path": posterPath,
        "media_type": mediaTypeValues.reverse[mediaType],
        "genre_ids": List<dynamic>.from(genreIds.map((x) => x)),
        "popularity": popularity,
        "release_date": "${releaseDate.year.toString().padLeft(4, '0')}-${releaseDate.month.toString().padLeft(2, '0')}-${releaseDate.day.toString().padLeft(2, '0')}",
        "video": video,
        "vote_average": voteAverage,
        "vote_count": voteCount,
        "name": name,
        "original_name": originalName,
        "first_air_date": "${firstAirDate.year.toString().padLeft(4, '0')}-${firstAirDate.month.toString().padLeft(2, '0')}-${firstAirDate.day.toString().padLeft(2, '0')}",
        "origin_country": List<dynamic>.from(originCountry.map((x) => x)),
    };
}

enum MediaType { MOVIE, TV }

final mediaTypeValues = EnumValues({
    "movie": MediaType.MOVIE,
    "tv": MediaType.TV
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
