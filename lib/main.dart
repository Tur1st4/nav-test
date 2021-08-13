import 'package:flutter/material.dart';
import 'package:nav_test/home.page.dart';

void main() => runApp(MainApp());

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nav',
      debugShowCheckedModeBanner: false,
      home: HomePage(
        nome: 'Home',
        nomeCompleto: 'Home',
        lista: [],
      ),
    );
  }
}
