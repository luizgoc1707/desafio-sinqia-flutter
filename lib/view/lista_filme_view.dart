import 'package:flutter/material.dart';
import '../model/filme.dart';
import '../viewmodel/lista_filme_viewmodel.dart';

class ListaFilme extends StatefulWidget {
  ListaFilme({Key? key}) : super(key: key);

  @override
  State<ListaFilme> createState() => _ListaFilmeState();
}

class _ListaFilmeState extends State<ListaFilme> {
  final viewModel = ListaFilmeViewModel();

  @override
  void initState() {
    super.initState();
    viewModel.getFilmes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.deepOrangeAccent,
            title: Text('Catálogo de Filmes')),
        body: StreamBuilder<List<Filme>>(
            stream: viewModel.streamController.stream,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data!.length + 1,
                    itemBuilder: (context, position) {
                      if (position < snapshot.data!.length) {
                        final movie = snapshot.data![position];

                        return ListTile(
                          title: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Text(
                              movie.title,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          subtitle: Text(
                            movie.overview,
                            maxLines: 4,
                            overflow: TextOverflow.ellipsis,
                          ),
                          leading: Image.network(
                              'https://image.tmdb.org/t/p/w500${movie.backdropPath}'),
                        );
                      } else {
                        viewModel.getFilmes();
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          child: Center(child: CircularProgressIndicator()),
                        );
                      }
                    });
              }

              return const Center(child: CircularProgressIndicator());
            }));
  }
}
