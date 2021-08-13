import 'package:flutter/material.dart';
import 'package:nav_test/home.page.dart';

class ListTileWidget extends StatelessWidget {
  final HomePage widget;
  final List<dynamic> lista;
  final int index;

  ListTileWidget(
      {required this.widget, required this.lista, required this.index});

  @override
  Widget build(BuildContext context) {
    String nomeCompleto = '${widget.nomeCompleto} -> ${lista[index]["desc"]}';

    return ListTile(
      leading: lista[index]["tipo"] == 'menu'
          ? Icon(Icons.folder)
          : Icon(Icons.code),
      title: Text(lista[index]["desc"]),
      onTap: () => lista[index]["tipo"] == 'menu'
          ? Navigator.push(
              context,
              MaterialPageRoute(builder: (_) {
                return HomePage(
                  nome: lista[index]["desc"],
                  nomeCompleto: nomeCompleto,
                  lista: lista[index]["itens"],
                );
              }),
            )
          : ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                duration: Duration(seconds: 2),
                content: Text('Comando: ${lista[index]["comando"]}'),
              ),
            ),
    );
  }
}
