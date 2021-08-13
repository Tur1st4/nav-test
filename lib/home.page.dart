import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:nav_test/json.dart';
import 'package:nav_test/listtile.widget.dart';

class HomePage extends StatefulWidget {
  final String nome;
  final String nomeCompleto;
  final JsonUtils jsutil = JsonUtils();
  List<dynamic> lista = [];

  HomePage(
      {required this.lista, required this.nome, required this.nomeCompleto});
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    print(widget.nomeCompleto);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.nome}'),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            child: Text(widget.nomeCompleto),
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          widget.lista.length > 0
              ? Expanded(
                  child: ListView.separated(
                      itemBuilder: (_, index) {
                        return ListTileWidget(
                          widget: widget,
                          lista: widget.lista,
                          index: index,
                        );
                      },
                      separatorBuilder: (_, index) {
                        return Divider();
                      },
                      itemCount: widget.lista.length),
                )
              : FutureBuilder(
                  future: widget.jsutil.read(),
                  builder: (_, snapshot) {
                    if (snapshot.hasData) {
                      final List<dynamic> lista =
                          json.decode(snapshot.data as String) as List<dynamic>;

                      return Expanded(
                        child: ListView.separated(
                            itemBuilder: (_, index) {
                              return ListTileWidget(
                                widget: widget,
                                lista: lista,
                                index: index,
                              );
                            },
                            separatorBuilder: (_, index) {
                              return Divider();
                            },
                            itemCount: lista.length),
                      );
                    }
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                ),
        ],
      ),
    );
  }
}
