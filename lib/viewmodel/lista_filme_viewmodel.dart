import 'dart:async';
import '../model/filme.dart';
import '../service/filme_service.dart';

class ListaFilmeViewModel {
  FilmeService _service = FilmeService();

  final streamController = StreamController<List<Filme>>();
  int _currentPage = 1;
  List<Filme> _listFilmes = [];

  void getFilmes() {
    _service.getFilmes(page: _currentPage).then((movies) {
      _listFilmes.addAll(movies);
      streamController.sink.add(_listFilmes);
      _currentPage++;
    });
  }

  void getTopCinco() {
    _service.getFilmesTopCinco().then((movies) {
      _listFilmes.addAll(movies);
      streamController.sink.add(_listFilmes);
    });
  }
}
