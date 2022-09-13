import 'package:flutter/material.dart';
import '../view/home_page_view.dart';

class SinqiaFilmeApp extends StatelessWidget {
  const SinqiaFilmeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
