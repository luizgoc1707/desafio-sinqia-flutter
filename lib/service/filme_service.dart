import 'dart:convert';
import '../model/filme.dart';
import 'package:http/http.dart' as http;

class FilmeService {
  static const key = '1ae611607df47683801126dfc826fb93';
  static const api = 'https://api.themoviedb.org/3/movie/';

  Future<List<Filme>> getFilmes({int page = 1}) async {
    var url = Uri.parse('${api}popular?api_key=$key&page=$page');

    final respose = await http.post(url);

    final json = jsonDecode(respose.body);
    return FilmeData.fromJson(json).filmes;
  }

  Future<List<Filme>> getFilmesTopCinco({int page = 1}) async {
    var url = Uri.parse('${api}top_rated?api_key=$key&page=$page');

    final respose = await http.post(url);

    final json = jsonDecode(respose.body);

    var teste = FilmeData.fromJson(json).filmes;

    int cont = FilmeData.fromJson(json).filmes.length;
    for (var item in FilmeData.fromJson(json).filmes) {
      if (cont <= 4) {
        teste.remove(cont);
      }
      cont--;
    }

    return teste;
  }
}
