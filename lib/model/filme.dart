class Filme {
  String title;
  String overview;
  String backdropPath;

  Filme.fromJson(Map json)
      : title = json['original_title'],
        overview = json['overview'],
        backdropPath = json['backdrop_path'];

  @override
  String toString() {
    return '{title: $title, overview: $overview, backdrop $backdropPath}';
  }
}

class FilmeData {
  int page;
  List<Filme> filmes;

  FilmeData(this.page, this.filmes);

  factory FilmeData.fromJson(Map json) {
    final page = json['page'] as int;
    final result = json['results'] as List<dynamic>;

    final filmes =
        result.map((jsonFilme) => Filme.fromJson(jsonFilme)).toList();

    return FilmeData(page, filmes);
  }

  @override
  String toString() {
    return '{page: $page, results: $filmes}';
  }
}
