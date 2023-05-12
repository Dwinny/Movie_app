import 'package:http/http.dart' as http;
import 'dart:developer';

import 'package:movie_app/model.dart';

class APIService {
  Future<List<MovieApp>?> getMovies() async {
    try {
      var url = Uri.parse(
          'https://api.themoviedb.org/3/trending/all/day?api_key=f978f92795046122eef1f40ad9fb23ec');
      var response = await http.get(url);
      if (response.statusCode == 200) {
        var movie = movieAppFromJson(response.body);
        return movie;
      } else {
        throw Exception(response.reasonPhrase);
      }
    } catch (e) {
      throw (Exception(e.toString()));
    }
  }
}
