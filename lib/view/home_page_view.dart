import 'package:flutter/material.dart';
import 'package:sinqia_filmes/view/lista_topCinco_view.dart';

import 'lista_filme_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _indiceAtual = 0;

  void onTabTapped(int index) {
    setState(() {
      _indiceAtual = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NovaPagina(_indiceAtual),
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _indiceAtual,
        backgroundColor: Colors.deepOrangeAccent,
        selectedItemColor: Colors.white,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.filter_9_plus_sharp), label: 'Todos Filmes'),
          BottomNavigationBarItem(
              icon: Icon(Icons.filter_5_rounded), label: 'Top 5'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'Favoritos'),
        ],
      ),
    );
  }
}

class NovaPagina extends StatelessWidget {
  int index = 0;
  NovaPagina(this.index);

  @override
  Widget build(BuildContext context) {
    if (index == 0) {
      return ListaFilme();
    } else if (index == 1) {
      return ListaTopCincoFilme();
    } else {
      return Container(
        child: Center(child: Text('pagina')),
      );
    }
  }
}
